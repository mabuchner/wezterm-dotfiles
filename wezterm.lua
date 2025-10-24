local wezterm = require('wezterm')
local startup = require('./startup')

-- local config = {}
local config = wezterm.config_builder()

config.color_scheme = 'Tokyo Night Storm'
config.font = wezterm.font('Source Code Pro')
config.font_size = 16

config.initial_rows = 48
config.initial_cols = 180

config.tab_max_width = 200 -- Not working?
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false

config.window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
}

config.window_decorations = "RESIZE"

config.keys = {
    -- Custom Claude Code configuration (/terminal-setup)
    {
        key = "Enter",
        mods = "SHIFT",
        action = wezterm.action { SendString = "\x1b\r" }
    },
}

wezterm.on('gui-startup', startup)


return config
