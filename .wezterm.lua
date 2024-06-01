local wezterm = require 'wezterm'

local mux = wezterm.mux
local act = wezterm.action

wezterm.on('gui-startup', function()
 local tab, pane, window = mux.spawn_window({})
 window:gui_window():maximize()
end)

config = {
   window_padding = {
      left = 2,
      right = 2,
      top = 8,
      bottom = 0,
   },

   -- mode = "maximized",

   enable_tab_bar = false,
   -- hide_tab_bar_if_only_one_tab = true,
   color_scheme = 'tokyonight_night',
   -- color_scheme = 'darkplus',
   -- color_scheme = 'Abernathy',
   font = wezterm.font('JetBrainsMono Nerd Font', { weight = 500 }),
   window_background_opacity = 0.98, 
   font_size = 13,
   -- line_height = 0.95,
   -- line_height = 1.04,
   -- line_height = 1.14,

   use_dead_keys = false,
   scrollback_lines = 5000,

   adjust_window_size_when_changing_font_size = false,

   keys = {
      { key="F11", action=act.ToggleFullScreen },
      { key="i", mods="ALT|SHIFT", action=act{SplitHorizontal={domain="CurrentPaneDomain"}} },
      --Shortcut to create new tab
      { key="n", mods="ALT|SHIFT", action=act{SpawnTab="CurrentPaneDomain"} },
      { key="j", mods="ALT|SHIFT", action=act{ActivateTabRelative=-1} },
      { key="k", mods="ALT|SHIFT", action=act{ActivateTabRelative=1} },
      { key="l", mods="ALT|SHIFT", action=act{ActivatePaneDirection="Right"} },
      { key="h", mods="ALT|SHIFT", action=act{ActivatePaneDirection="Left"} },
      --Use Control + W to close the pane
      { key="w", mods="ALT|SHIFT", action=act{CloseCurrentPane={confirm=false}} },
      -- {
      --    key = 'c',
      --    mods = 'CTRL',
      --    action = wezterm.action_callback(function(window, pane)
      --       if pane:is_alt_screen_active() then
      --          window:perform_action(wezterm.action.SendKey{ key='c', mods='CTRL' }, pane)
      --       else
      --          window:perform_action(wezterm.action{ CopyTo = 'ClipboardAndPrimarySelection' }, pane)
      --       end
      --    end),
      -- },
      {
         key = 'v',
         mods = 'CTRL',
         action = wezterm.action_callback(function(window, pane)
            window:perform_action(wezterm.action{ PasteFrom = 'Clipboard' }, pane)
         end),
      },
   },

   -- Customize the tab bar
   tab_bar_at_bottom = true,
   use_fancy_tab_bar = false, 

   -- window_frame = {
   --    font = wezterm.font { family = 'Noto Sans', weight = 'Regular' },
   -- }

}

return config
