--  _  __          _     _           _     
-- | |/ /___ _   _| |__ (_)_ __   __| |___ 
-- | ' // _ \ | | | '_ \| | '_ \ / _` / __|
-- | . \  __/ |_| | |_) | | | | | (_| \__ \
-- |_|\_\___|\__, |_.__/|_|_| |_|\__,_|___/
--           |___/                         

local mainMod = "SUPER"

-- define scripts
local menu="fuzzel --config=/home/bytesyntaxx/.config/fuzzel/config.ini"
local screenshot = "/home/bytesyntaxx/.config/hypr/scripts/screenshot.sh"
local rlhyprpaper = "/home/bytesyntaxx/.config/hypr/scripts/reload-hyprpaper.sh"
local rlwaybar = "/home/bytesyntaxx/.config/hypr/scripts/reload-waybar.sh"
local changetheme = "/home/bytesyntaxx/.config/hypr/scripts/change-theme.sh"

local editor = "code --enable-features=UseOzonePlatform --ozone-platform=wayland"
local obsidian = "obsidian --enable-features=UseOzonePlatform --ozone-platform=wayland"
local cliphist = "cliphist list | fuzzel -d --config=/home/bytesyntaxx/.config/fuzzel/config.ini | cliphist decode | wl-copy"
local mute = "pactl set-source-mute @DEFAULT_SOURCE@ toggle"

--bind = CTRL SHIFT, ESCAPE, exec, sysmontask

-- Set Keybinds
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("MOZ_ENABLE_WAYLAND=1 librewolf"))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(editor))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("hyprlock"))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd("kitty"))
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd(cliphist))
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd("pcmanfm"))
hl.bind(mainMod .. " + SHIFT + E", hl.dsp.exec_cmd(obsidian))
hl.bind(mainMod .. " + SHIFT + M", hl.dsp.exec_cmd(mute))
hl.bind(mainMod .. " + SHIFT + N", hl.dsp.exec_cmd(rlwaybar))
hl.bind(mainMod .. " + SHIFT + R", hl.dsp.exec_cmd(rlhyprpaper))
hl.bind(mainMod .. " + SHIFT + T", hl.dsp.exec_cmd(changetheme))
hl.bind("PRINT", hl.dsp.exec_cmd(screenshot))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + h",  hl.dsp.focus({ direction = "left"  }))
hl.bind(mainMod .. " + l",  hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + k",  hl.dsp.focus({ direction = "up"    }))
hl.bind(mainMod .. " + j",  hl.dsp.focus({ direction = "down"  }))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i}))
    hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })
