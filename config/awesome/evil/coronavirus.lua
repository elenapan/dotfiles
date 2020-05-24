-- Provides:
-- evil::coronavirus
--      cases_total (integer)
--      cases_today (integer)
--      deaths_total (integer)
--      deaths_today (integer)
local awful = require("awful")
local helpers = require("helpers")
local naughty = require("naughty")

local update_interval = 60 * 60 * 12 -- 12 hours
local country = user.coronavirus_country or "germany"
local temp_file = "/tmp/awesomewm-evil-coronavirus-"..country

local coronavirus_script = [[
  sh -c '
  country="]]..country..[["

  stats=$(curl "https://corona-stats.online/$country?format=json" 2>/dev/null)

  cases_total="$(echo $stats | jq ".data[0].cases")"
  cases_today="$(echo $stats | jq ".data[0].todayCases")"
  deaths_total="$(echo $stats | jq ".data[0].deaths")"
  deaths_today="$(echo $stats | jq ".data[0].todayDeaths")"

  echo CTOTAL@$cases_total@CTODAY@$cases_today@DTOTAL@$deaths_total@DTODAY@$deaths_today@
  ']]

helpers.remote_watch(coronavirus_script, update_interval, temp_file, function(stdout)
    local cases_total = stdout:match('^CTOTAL@(.*)@CTODAY')
    local cases_today = stdout:match('CTODAY@(.*)@DTOTAL')
    local deaths_total = stdout:match('DTOTAL@(.*)@DTODAY')
    local deaths_today = stdout:match('DTODAY@(.*)@')

    -- If it is found, we assume the command succeeded
    if cases_total then
        awesome.emit_signal("evil::coronavirus", cases_total, cases_today, deaths_total, deaths_today)
    else
        -- Remove temp_file to force an update the next time
        awful.spawn.with_shell("rm "..temp_file)
        awesome.emit_signal("evil::coronavirus", -1, -1, -1, -1)
    end
end)
