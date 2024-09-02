local wezterm = require('wezterm')
local mux = wezterm.mux

local startup_dirs = require('./startup_dirs')

local function startup()
    if #startup_dirs == 0 then
        local tab, _, _ = mux.spawn_window {}
        tab:activate()
        return
    end

    local first_dir = startup_dirs[1]

    local tab1, _, window = mux.spawn_window {
        cwd = first_dir.path
    }
    if first_dir.title then
        tab1:set_title(first_dir.title)
    end

    for i = 2, #startup_dirs do
        local dir = startup_dirs[i]
        local tab = window:spawn_tab({
            cwd = dir.path
        })
        if dir.title then
            tab:set_title(dir.title)
        end
    end

    tab1:activate()
end

return startup
