local wezterm = require('wezterm')
local mux = wezterm.mux

local startup_dirs = require('./startup_dirs')

local function startup()
    if #startup_dirs == 0 then
        local tab, _, _ = mux.spawn_window {}
        tab:activate()
        return
    end

    local tab1, _, window = mux.spawn_window {
        cwd = startup_dirs[1]
    }

    for i = 2, #startup_dirs do
        local dir = startup_dirs[i]
        window:spawn_tab({
            cwd = dir
        })
    end

    tab1:activate()
end

return startup
