local menu = "fuzzel"
hl.curve("myBezier", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.05 } } })
hl.animation({
    leaf = "windows",
    enabled = true,
    speed = 7,
    bezier = "myBezier",
})
hl.animation({
    leaf = "windowsOut",
    enabled = true,
    speed = 7,
    bezier = "default",
    style = "popin 80%",
})
hl.animation({
    leaf = "border",
    enabled = true,
    speed = 10,
    bezier = "default",
})
hl.animation({
    leaf = "borderangle",
    enabled = true,
    speed = 8,
    bezier = "default",
})
hl.animation({
    leaf = "fade",
    enabled = true,
    speed = 7,
    bezier = "default",
})
hl.animation({
    leaf = "workspaces",
    enabled = true,
    speed = 6,
    bezier = "default",
})

hl.bind("SUPER + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))
hl.bind("SUPER + Q", hl.dsp.exec_cmd("KITTY_ENABLE_WAYLAND=1 kitty"))
hl.bind("SUPER + C", hl.dsp.window.close())
hl.bind("SUPER + M", hl.dsp.exit())
hl.bind("SUPER + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind("SUPER + D", hl.dsp.exec_cmd("code --enable-features=UseOzonePlatform --ozone-platform=x11"))
hl.bind("SUPER + H", hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + L", hl.dsp.focus({ direction = "right" }))
hl.bind("SUPER + K", hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + J", hl.dsp.focus({ direction = "down" }))
hl.bind("SUPER + SHIFT + H", hl.dsp.window.move({ direction = "l" }))
hl.bind("SUPER + SHIFT + L", hl.dsp.window.move({ direction = "r" }))
hl.bind("SUPER + SHIFT + K", hl.dsp.window.move({ direction = "u" }))
hl.bind("SUPER + SHIFT + J", hl.dsp.window.move({ direction = "d" }))
hl.bind("SUPER + SHIFT + Q", hl.dsp.workspace.toggle_special("Signal"))
hl.bind("SUPER + SHIFT + D", hl.dsp.workspace.toggle_special("Discord"))
hl.bind("SUPER + SHIFT + Z", hl.dsp.workspace.toggle_special("Spotify"))
hl.bind("SUPER + PRINT", hl.dsp.exec_cmd("hyprshot -m window"))
hl.bind("PRINT", hl.dsp.exec_cmd("hyprshot -m output"))
hl.bind("SUPER + SHIFT + PRINT", hl.dsp.exec_cmd("hyprshot -m region"))
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"))
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))
for i = 1, 10 do
    hl.bind("SUPER + " .. i % 10, hl.dsp.focus({ workspace = i }))
    hl.bind("SUPER + SHIFT + " .. i % 10, hl.dsp.window.move({ workspace = i }))
end

hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_SINK@ 5%-"), { repeating = true })
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_SINK@ 5%+"), { repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 5%-"), { repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s 5%+"), { repeating = true })
hl.bind("SUPER + right", hl.dsp.window.resize({ x = 5, y = 0, relative = true }), { repeating = true })
hl.bind("SUPER + SHIFT + right", hl.dsp.window.resize({ x = 10, y = 0, relative = true }), { repeating = true })
hl.bind("SUPER + left", hl.dsp.window.resize({ x = -5, y = 0, relative = true }), { repeating = true })
hl.bind("SUPER + SHIFT + left", hl.dsp.window.resize({ x = -10, y = 0, relative = true }), { repeating = true })
hl.bind("SUPER + up", hl.dsp.window.resize({ x = 0, y = 5, relative = true }), { repeating = true })
hl.bind("SUPER + SHIFT + up", hl.dsp.window.resize({ x = 0, y = 10, relative = true }), { repeating = true })
hl.bind("SUPER + down", hl.dsp.window.resize({ x = 0, y = -5, relative = true }), { repeating = true })
hl.bind("SUPER + SHIFT + down", hl.dsp.window.resize({ x = 0, y = -10, relative = true }), { repeating = true })

hl.bind("SUPER + mouse:272", hl.dsp.window.drag())
hl.bind("SUPER + mouse:273", hl.dsp.window.resize())

hl.bind("SUPER + R", hl.dsp.exec_cmd("pkill wofi || " .. menu), { release = true })
hl.bind("SUPER + B", hl.dsp.exec_cmd("firefox"), { release = true })
hl.bind("SUPER + SPACE", hl.dsp.exec_cmd("pkill clipse || kitty --class clipse -e clipse"), { release = true })
hl.bind("SUPER + X", hl.dsp.exec_cmd("pkill pavucontrol || pavucontrol"), { release = true })

hl.monitor({
    output = "",
    mode = "highres",
    position = "auto",
    scale = "1",
})

hl.config({
    animations = {
        enabled = false,
    },
    binds = {
        pass_mouse_when_bound = true,
    },
    decoration = {
        blur = {
            enabled = true,
            passes = 1,
            size = 3,
            vibrancy = 0.169600,
        },
        active_opacity = 1.000000,
        inactive_opacity = 1.000000,
        rounding = 10,
    },
    dwindle = {
        preserve_split = true,
    },
    ecosystem = {
        no_update_news = true,
    },
    general = {
        allow_tearing = false,
        border_size = 1,
        col = {
            active_border = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45 },
            inactive_border = "rgba(595959aa)",
        },
        gaps_in = 0,
        gaps_out = 0,
        resize_on_border = false,
    },
    input = {
        touchpad = {
            drag_3fg = 1,
            natural_scroll = true,
        },
        follow_mouse = 1,
        kb_layout = "us",
        sensitivity = 0,
    },
    master = {
        new_status = "master",
    },
    misc = {
        disable_hyprland_logo = true,
        force_default_wallpaper = 2,
    },
    xwayland = {
        force_zero_scaling = true,
    },
})

hl.window_rule({ match = { class = "^[Ss]ignal$" }, workspace = "special:Signal silent" })
hl.window_rule({ match = { class = "^[Dd]iscord$" }, workspace = "special:Discord silent" })
hl.window_rule({ match = { class = "^spotify$" }, workspace = "special:Spotify silent" })

hl.on("hyprland.start", function()
    hl.exec_cmd("clipse -listen")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("swaybg -i /nix/persist/bonsai/home-manager/dbbg.png")
    hl.exec_cmd("waybar")
    hl.exec_cmd("signal-desktop --enable-features=UseOzonePlatform --ozone-platform=x11")
    hl.exec_cmd("discord --enable-features=UseOzonePlatform --ozone-platform=x11")
    hl.exec_cmd("kitty --class spotify spotify_player")
end)
