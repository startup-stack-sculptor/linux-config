local wezterm = require('wezterm')
local act = wezterm.action
local config = wezterm.config_builder()
local mux = wezterm.mux




-- colors and fonts
config.color_scheme = 'Gruvbox Material (Gogh)'
config.font_size = 12

-- base config and minimal layout
-- config.initial_cols = 100
-- config.initial_rows = 1

config.inactive_pane_hsb = { saturation = 0.3, brightness = 1 }
config.initial_rows = 40
config.max_fps = 120
config.scrollback_lines = 50000
config.send_composed_key_when_left_alt_is_pressed = false
config.send_composed_key_when_right_alt_is_pressed = true
config.show_new_tab_button_in_tab_bar = false
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.window_decorations = 'RESIZE'
config.window_padding = { left = 20, right = 0, top = 20, bottom = 0 }

-- key mappings
config.keys = {
  { key = '/', mods = 'CTRL',  action = act.SplitHorizontal },
  { key = '-',  mods = 'CTRL',  action = act.SplitVertical },
  { key = '[',  mods = 'CTRL',  action = act.ActivateCopyMode },
  { key = 'z', mods = 'CTRL', action = act.TogglePaneZoomState },
  {key = 'q', mods = 'CTRL', action = wezterm.action.CloseCurrentPane { confirm = true }},
  { key = 'w',  mods = 'CTRL',  action = act.ShowLauncherArgs { flags = 'FUZZY|WORKSPACES' } },
    {
      key = 'o',
      mods = 'CTRL',
      action = act.ActivatePaneDirection 'Next',
    },
  {
    key = ',',
    mods = 'CTRL',
    action = act.PromptInputLine {
      description = 'Enter new name for tab',
      action = wezterm.action_callback(function(window, pane, line)
        if line then
          window:active_tab():set_title(line)
        end
      end),
    },
  },
  {
    key = '.',
    mods = 'CTRL',
    action = act.PromptInputLine {
      description = 'Rename current workspace',
      action = wezterm.action_callback(function(window, pane, line)
        if line then
          mux.rename_workspace(mux.get_active_workspace(), line)
        end
      end),
    },
  },
  {
    key = 'n',
    mods = 'CTRL',
    action = act.PromptInputLine {
      description = 'Enter name for new workspace',
      action = wezterm.action_callback(function(window, pane, line)
        if line then
          window:perform_action(act.SwitchToWorkspace({ name = line }), pane)
        end
      end),
    },
  },
  {
    key = 'w',
    mods = 'ALT|SHIFT',
    action = act.CloseCurrentPane { confirm = true },
  },
}

-- set tab-title to current dir if not set explicitly
wezterm.on('format-tab-title', function(tab)
  local cwd = get_current_working_dir(tab)
  local title = tab.tab_title
  local num = tab.tab_index + 1

  if title and #title > 0 then
    return string.format('  %s %s  ', num, title)
  end

  return string.format('  %s %s  ', num, cwd)
end)

-- show workspace on the left side of tabbar
wezterm.on('update-status', function(window)
  local workspace = mux.get_active_workspace()
  window:set_left_status(string.format('  %s  ', workspace))
end)

-- always maximise and start default session with mutt, notes and dotfiles


-- center wezterm on spawn
wezterm.on("gui-startup", function(cmd)
  local screen = wezterm.gui.screens().active
  local ratio = 0.7
  local width, height = screen.width * ratio, screen.height * ratio
  local tab, pane, window = wezterm.mux.spawn_window {
    position = {
      x = (screen.width - width) / 2,
      y = (screen.height - height) / 2,
      origin = 'ActiveScreen' }
  }
  window:gui_window():set_inner_size(width, height)
end)

return config