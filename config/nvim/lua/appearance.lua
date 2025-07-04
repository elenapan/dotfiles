-- Load colorscheme
vim.cmd [[colorscheme lena]]

-- Display different types of white spaces
vim.o.list = true
vim.o.listchars = 'tab:│ ,trail:•,extends:#,nbsp:.'
-- set listchars=tab:›\ ,trail:•,extends:#,nbsp:.

-- Characters to fill the statuslines and vertical separators
vim.o.fillchars='stl:━,stlnc:━,vert:┃,vertleft:┫,vertright:┣,verthoriz:╋,horiz:━,horizup:┻,horizdown:┳,eob:⬝'

-- Only one statusline for all windows
vim.opt.laststatus = 3
-- Always show tabline, since statusline has no information
vim.o.showtabline = 2

local function LineInfo()
    return table.concat {
        "%#CustomTablineBubbleEdge#",
        "%#CustomTablineBubbleLine# ",
        "%2l", -- Space-padded line number
        "%#CustomTablineBubbleSeparator# ✖ ",
        "%#CustomTablineBubbleColumn#",
        "%-2c", -- Space padded, right-aligned column number
        " %#CustomTablineBubbleEdge#",
        "%#CustomTablineBubblePercentage# ",
        "%P", -- Space-padded line number
        "%#CustomTablineBubbleSeparator# ● ",
        "%#CustomTablineBubbleTotalLines#",
        "%L",
        " %#CustomTablineBubbleEdge# ",
    }
end

function FiletypeAndDirectoryAndGit()
    local full_path = vim.fn.expand('%:p:h'):gsub(vim.fn.expand('~'), '~')
    local components = vim.split(full_path, '/')

    -- Get the direct parent directory
    local parent_dir = table.remove(components)

    -- Truncate each component to a maximum of three characters
    for i, component in ipairs(components) do
        components[i] = string.sub(component, 1, 3)
    end

    -- Add the direct parent directory back to the components
    table.insert(components, parent_dir)

    -- Reconstruct the truncated path
    local truncated_path = table.concat(components, '/')

    local git_info = vim.b.gitsigns_status_dict

    local git_info_or_end_bubble
    if not git_info or git_info.head == "" then
        git_info_or_end_bubble = " %#CustomTablineBubbleEdge#"
    else
        git_info_or_end_bubble = " %#CustomTablineBubbleEdge#%#CustomTablineBubbleGit# "..git_info.head.." %#CustomTablineBubbleEdge#"
    end

    return table.concat {
        "%#CustomTablineBubbleEdge#",
        "%#CustomTablineBubbleFiletype# ",
        vim.bo.filetype == "" and "-" or vim.bo.filetype,
        " %#CustomTablineBubbleEdge#",
        "%#CustomTablineBubbleDirectory# ",
        truncated_path,
        git_info_or_end_bubble
    }
end

function Tabs()
    local selected_tabnr = vim.fn.tabpagenr()
    local total_tabs = vim.fn.tabpagenr('$')

    local tabs_string = ''
    local i = 1
    while i <= total_tabs do
        local buflist = vim.fn.tabpagebuflist(i)
        local winnr = vim.fn.tabpagewinnr(i)
        local file = vim.fn.fnamemodify(vim.fn.bufname(buflist[winnr]), ':p:t')
        if (file == '') then
            file = '[No Name]'
        end
        local tab_bubble, hi_label, hi_index
        if (i == selected_tabnr) then
            hi_index = "%#CustomTablineBubbleIndexSel#"
            if (vim.bo.modified) then
                hi_label = "%#CustomTablineBubbleLabelSelModified#"
            else
                hi_label = "%#CustomTablineBubbleLabelSel#"
            end
        else
            hi_index = "%#CustomTablineBubbleIndex#"
            hi_label = "%#CustomTablineBubbleLabel#"
        end

        tab_bubble = table.concat {
            "%"..i.."T", -- Start of clickable section for tab i
            '%#CustomTablineBubbleEdge#',
            hi_index..' '..i..' ',
            '%#CustomTablineBubbleEdge#',
            '%#CustomTablineBubbleEdge#',
            hi_label..' '..file..' ',
            '%#CustomTablineBubbleEdge#',
            "%X", -- End of clickable section
            ' ',
        }
        tabs_string = tabs_string..tab_bubble
        i = i + 1
    end
    return tabs_string
end

function CustomTabline()
    return table.concat {
        Tabs(),
        "%=", -- Switch to right side
        FiletypeAndDirectoryAndGit(),
        " ",
        LineInfo(),
    }
end

-- Empty since all the info is in the tabline now
-- TODO Add LSP info in statusline at some point
function CustomStatusline()
    return ""
end

-- Since some of the displayed information does not update automatically in the
-- tabline, but only the statusline, we need to use this autocmd to update it
-- on relevant events
vim.api.nvim_create_autocmd({'CursorMoved', 'BufEnter'}, {
    callback = function()
        vim.api.nvim_command('redrawtabline')
    end,
})

vim.api.nvim_exec([[
  set tabline=%!v:lua.CustomTabline()
  set statusline=%!v:lua.CustomStatusline()
]], false)
