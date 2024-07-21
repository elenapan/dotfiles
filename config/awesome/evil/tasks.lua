-- Provides:
-- evil::tasks
--      tasks array
local awful = require("awful")
local gears = require("gears")
local helpers = require("helpers")

local org_deadline_warning_days = 14
local org_schedule_warning_days = 7

local home = os.getenv("HOME")
local org_files = {
    home.."/notes/todo.org",
    home.."/notes/birthdays.org",
    home.."/notes/finance.org",
    home.."/notes/health.org",
    home.."/notes/home.org"
}
local file_list_str = table.concat(org_files, " ")

local function lines_in_string(s)
    local lines = {}
    for line in s:gmatch("([^\n]*)\n?") do
        if line ~= "" then
            table.insert(lines, line)
        end
    end
    return lines
end

local function calculate_recurrence(date, recurrence)
    if not recurrence or recurrence == "" then return nil end
    local amount, unit = recurrence:match("%+(%d+)([dmy])")
    amount = tonumber(amount)
    if unit == "d" then
        return os.time({year = os.date("*t", date).year, month = os.date("*t", date).month, day = os.date("*t", date).day + amount})
    elseif unit == "m" then
        local year = os.date("*t", date).year
        local month = os.date("*t", date).month + amount
        year = year + math.floor((month - 1) / 12)
        month = (month - 1) % 12 + 1
        local day = math.min(os.date("*t", date).day, os.date("*t", os.time({year = year, month = month + 1, day = 0})).day)
        return os.time({year = year, month = month, day = day})
    elseif unit == "y" then
        return os.time({year = os.date("*t", date).year + amount, month = os.date("*t", date).month, day = os.date("*t", date).day})
    end
    return nil
end

local function get_time_range()
    local today = os.time()
    return today, today
end

local function pretty_print_date(input_date)
    local today = os.time()
    local delta = os.difftime(input_date, today) / (24 * 3600)
    if delta == 0 then
        return "today"
    elseif delta == 1 then
        return "tomorrow"
    elseif delta == -1 then
        return "yesterday"
    -- elseif delta >= -5 and delta <= -2 then
    --     return math.abs(delta) .. " days ago"
    -- elseif delta >= 2 and delta <= 5 then
    --     return "in " .. delta .. " days"
    else
        return os.date("%A %d %B", input_date):lower()
    end
end

local fields_to_compare = {
    "file",
    "title",
    "type",
    "date_obj",
    "recurrence",
    "time_start",
    "time_end",
}
local function compare_tasks(task1, task2)
    for _, field in ipairs(fields_to_compare) do
        if task1[field] ~= task2[field] then
            return false
        end
    end
    return true
end

local function compare_task_arrays(array1, array2)
    if #array1 ~= #array2 then
        return false
    end

    for i = 1, #array1 do
        if not compare_tasks(array1[i], array2[i]) then
            return false
        end
    end

    return true
end

local old_tasks = {}
local function update_tasks()
    -- Search for the pattern and also print the line before it (task title)
    local search_entries_cmd = 'grep -B 1 -E "^(SCHEDULED|DEADLINE):" '..file_list_str..' | grep -v -E "^--$"'

    awful.spawn.easy_async_with_shell(search_entries_cmd, function(out)
        local entries = {}
        local lines = lines_in_string(out)

        -- Every entry is 2 lines (title and date)
        for i=1,#lines,2 do
            local title_line = lines[i]
            local event_line = lines[i+1]

            local full_path, _, status_and_title = title_line:match("^(.+)%-(%*+)%s*(.*)")
            local file = full_path:match("^.*/([^/]+)%.%w+$")

            local status, title
            local first_word, remaining = status_and_title:match("^(%S+)%s*(.*)")
            if first_word and first_word:match("^[A-Z]+$") then
                status = first_word
                title = remaining
            else
                title = status_and_title
            end

            local event_type, date_str = event_line:match(":([A-Z]+): <(%d%d%d%d%-%d%d%-%d%d)")
            local date_obj = os.time({year = tonumber(date_str:sub(1,4)), month = tonumber(date_str:sub(6,7)), day = tonumber(date_str:sub(9,10))})
            -- Match optional time and recurrence
            local time_start = event_line:match(" (%d%d:%d%d)")
            local time_end = event_line:match("-(%d%d:%d%d)")
            local recurrence = event_line:match("(%+[%d%w]*)>")

            table.insert(entries, {
                file = file,
                title = title,
                status = status,
                event_type = event_type,
                date = date_str,
                date_obj = date_obj,
                time_start = time_start,
                time_end = time_end,
                recurrence = recurrence
            })
        end

        -- Generate tasks array
        local tasks = {}
        local time_range_start, time_range_end = get_time_range()
        local today = os.time({year = os.date("*t").year, month = os.date("*t").month, day = os.date("*t").day})

        for _, entry in ipairs(entries) do
            local date_obj = entry.date_obj
            local status = entry.status
            local event_type = entry.event_type
            local title = entry.title
            while true do
                if not date_obj then break end

                if (status == "DONE" or status == "KILL") and not (time_range_start <= date_obj and date_obj <= time_range_end) then
                    break
                end

                if event_type == "DEADLINE" then
                    if date_obj > (today + org_deadline_warning_days * 24 * 3600) then break end
                else
                    if date_obj > (today + org_schedule_warning_days * 24 * 3600) then break end
                end

                table.insert(tasks, {
                    file = entry.file,
                    title = title,
                    type = event_type:lower(),
                    status = status and status:lower(),
                    recurrence = entry.recurrence,
                    overdue = date_obj < today,
                    date = os.date("%Y-%m-%d", date_obj),
                    date_obj = date_obj,
                    date_pretty = pretty_print_date(date_obj),
                    time_start = entry.time_start,
                    time_end = entry.time_end
                })

                if status == "DONE" or status == "KILL" then break end

                date_obj = calculate_recurrence(date_obj, entry.recurrence)
            end
        end

        table.sort(tasks, function(a, b)
            return a.date_obj < b.date_obj
        end)

        if not compare_task_arrays(tasks, old_tasks) then
            awesome.emit_signal("evil::tasks", tasks)
            old_tasks = tasks
        end

    end)
end

-- Update tasks periodically
local update_interval = 60
gears.timer {
    autostart = true,
    timeout = update_interval,
    single_shot = false,
    call_now = true,
    callback = update_tasks
}

-- Also update tasks when related files change
-- Requires inotify-tools
local org_files_subscribe_script = [[
   bash -c "
   while true; do inotifywait -qq -e modify ]]..file_list_str..[[; echo; done
"]]

-- Kill old inotifywait process
-- Search for "[w]hile" instead of "while" to prevent grep from matching itself
awful.spawn.easy_async_with_shell("ps x | grep \"[w]hile true; do inotifywait -qq -e modify "..org_files[1].."\" | awk '{print $1}' | xargs kill", function (_)
    -- Update tasks with each line printed
    awful.spawn.with_line_callback(org_files_subscribe_script, {
        stdout = function(_)
            update_tasks()
        end
    })
end)
