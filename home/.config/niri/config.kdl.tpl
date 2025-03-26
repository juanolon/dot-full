// This config is in the KDL format: https://kdl.dev
// "/-" comments out the following node.

prefer-no-csd

screenshot-path "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png"
spawn-at-startup "/home/juanolon/.config/niri/scripts/clamshell";


switch-events {
    lid-close { spawn "/home/juanolon/.config/niri/scripts/clamshell"; }
    lid-open { spawn "/home/juanolon/.config/niri/scripts/clamshell"; }
}

input {
    keyboard {
        xkb {
            layout "us-german-umlaut"
            options "ctrl:nocaps, lv3:lalt_switch"
        }
    }

    touchpad {
        tap
        dwt
        dwtp
        // drag-lock
        // natural-scroll
        accel-speed 0.2
        accel-profile "adaptive"
        // accel-profile "flat"
        // scroll-method "two-finger"
        // disabled-on-external-mouse
    }

    mouse {
        // off
        // natural-scroll
        // accel-speed 0.2
        // accel-profile "flat"
        // scroll-method "no-scroll"
    }

    trackpoint {
        // off
        // natural-scroll
        // accel-speed 0.2
        // accel-profile "flat"
        // scroll-method "on-button-down"
        // scroll-button 273
        // middle-emulation
    }
}

output "eDP-1" {
    mode "1920x1080"

    scale 1
    // position x=1280 y=0
}

layout {
    center-focused-column "never"

    // You can customize the widths that "switch-preset-column-width" (Mod+R) toggles between.
    preset-column-widths {
        // Proportion sets the width as a fraction of the output width, taking gaps into account.
        // For example, you can perfectly fit four windows sized "proportion 0.25" on an output.
        // The default preset widths are 1/3, 1/2 and 2/3 of the output.
        proportion 0.5
        proportion 0.66667
        proportion 0.33333

        // Fixed sets the width in logical pixels exactly.
        // fixed 1920
    }

    // You can also customize the heights that "switch-preset-window-height" (Mod+Shift+R) toggles between.
    // preset-window-heights { }

    // You can change the default width of the new windows.
    default-column-width { proportion 0.5; }
    // If you leave the brackets empty, the windows themselves will decide their initial width.
    // default-column-width {}

    focus-ring {
        width 2
        active-color "$base$"

        // Color of the ring on inactive monitors.
        inactive-color "#908caa"
    }

    border {
        off
    }

    gaps 12

    struts {
        // reset gaps on top/bottom
        top -6
        bottom -6
    }
}

window-rule {
    match is-active=true

    shadow {
        on
        // Softness controls the shadow blur radius.
        softness 30

        // Spread expands the shadow.
        spread 5

        // Offset moves the shadow relative to the window.
        offset x=0 y=5

        // You can also change the shadow color and opacity.
        // color "$base$"
        color "#191724"
    }
}

window-rule {
    geometry-corner-radius 5
    clip-to-geometry true
}


window-rule {
    match app-id=r#"firefox$"# title="^Picture-in-Picture$"
    open-floating true
}
window-rule {
    match app-id=r#"^pinentry-qt$"#
    block-out-from "screen-capture"
}
window-rule {
    match app-id="albert"
    focus-ring {
        off
    }
    border {
        off
    }
    shadow {
        off
    }
}
window-rule {
    match is-window-cast-target=true

    focus-ring {
        active-color "#f38ba8"
        inactive-color "#7d0d2d"
    }

    border {
        inactive-color "#7d0d2d"
    }

    shadow {
        color "#7d0d2d70"
    }

    tab-indicator {
        active-color "#f38ba8"
        inactive-color "#7d0d2d"
    }
}

workspace "music"
window-rule {
    match app-id="spotify"
    open-on-workspace "music"
}

binds {
    // Mod-Shift-/, which is usually the same as Mod-?,
    // shows a list of important hotkeys.
    Mod+Shift+Slash { show-hotkey-overlay; }

    Mod+Return { spawn "kitty"; }

    Mod+Shift+Q { close-window; }

    Mod+Space { spawn "albert" "show" "apps "; }
    // Mod+C { spawn "albert" "show" "= "; }

    Super+Alt+L { spawn "swaylock"; }

    Super+Escape { spawn "wlr-which-key" "/home/juanolon/.config/wlr-which-key/system.yaml"; }
    Super+S { spawn "wlr-which-key" "/home/juanolon/.config/wlr-which-key/screenshot.yaml"; }
    Super+E { spawn "wlr-which-key" "/home/juanolon/.config/wlr-which-key/toggles.yaml"; }


    Mod+C { center-column; }

    Print { screenshot; }
    Ctrl+Print { screenshot-screen; }
    Alt+Print { screenshot-window; }

    Mod+Shift+E { quit; }

    // Powers off the monitors. To turn them back on, do any input like
    // moving the mouse or pressing any other key.
    // Mod+Shift+P { power-off-monitors; }
    // The allow-when-locked=true property makes them work even when the session is locked.

    //
    // Fn Keys
    //
    XF86AudioRaiseVolume allow-when-locked=true { spawn "~/.bin/volume" "up"; }
    XF86AudioLowerVolume allow-when-locked=true { spawn "~/.bin/volume" "down"; }
    XF86AudioMute        allow-when-locked=true { spawn "~/.bin/volume" "mute"; }
    XF86AudioMicMute     allow-when-locked=true { spawn "~/.bin/volume" "nomic"; }

    XF86MonBrightnessDown allow-when-locked=true { spawn "~/.bin/backlight" "up"; }
    XF86MonBrightnessUp allow-when-locked=true { spawn "~/.bin/backlight" "down"; }

    XF86Display allow-when-locked=true { spawn "/home/juanolon/.config/niri/scripts/clamshell"; }

    XF86NotificationCenter allow-when-locked=true { spawn ".config/eww/scripts/dock" "toggle"; }
    // XF86PickupPhone
    // XF86HangupPhone
    // XF86HangupPhone
    XF86Favorites allow-when-locked=true { spawn "albert" "show" "pass "; }

    //
    // WINDOWS
    //
    Mod+H     { focus-column-left; }
    // Mod+J     { focus-window-down; }
    // Mod+K     { focus-window-up; }
    Mod+J     { focus-window-or-workspace-down; }
    Mod+K     { focus-window-or-workspace-up; }
    Mod+L     { focus-column-right; }

    // Mod+Shift+H     { move-column-left; }
    Mod+Shift+H     { swap-window-left; }
    // Mod+Shift+J     { move-window-down; }
    // Mod+Shift+K     { move-window-up; }
    Mod+Shift+J     { move-window-down-or-to-workspace-down; }
    Mod+Shift+K     { move-window-up-or-to-workspace-up; }
    // Mod+Shift+L     { move-column-right; }
    Mod+Shift+L     { swap-window-right; }


    // Mod+Ctrl+H { focus-column-first; }
    Mod+Ctrl+H { move-column-left; }
    // Mod+Ctrl+L  { focus-column-last; }
    Mod+Ctrl+L  { focus-column-last; }


    // The following binds move the focused window in and out of a column.
    // If the window is alone, they will consume it into the nearby column to the side.
    // If the window is already in a column, they will expel it out.
    Mod+BracketLeft  { consume-or-expel-window-left; }
    Mod+BracketRight { consume-or-expel-window-right; }

    // Consume one window from the right to the bottom of the focused column.
    Mod+Comma  { consume-window-into-column; }
    // Expel the bottom window from the focused column to the right.
    Mod+Period { expel-window-from-column; }

    Mod+1 { focus-workspace 1; }
    Mod+2 { focus-workspace 2; }
    Mod+3 { focus-workspace 3; }
    Mod+4 { focus-workspace 4; }
    Mod+5 { focus-workspace 5; }
    Mod+6 { focus-workspace 6; }
    Mod+7 { focus-workspace 7; }
    Mod+8 { focus-workspace 8; }
    Mod+9 { focus-workspace 9; }
    Mod+Shift+1 { move-column-to-workspace 1; }
    Mod+Shift+2 { move-column-to-workspace 2; }
    Mod+Shift+3 { move-column-to-workspace 3; }
    Mod+Shift+4 { move-column-to-workspace 4; }
    Mod+Shift+5 { move-column-to-workspace 5; }
    Mod+Shift+6 { move-column-to-workspace 6; }
    Mod+Shift+7 { move-column-to-workspace 7; }
    Mod+Shift+8 { move-column-to-workspace 8; }
    Mod+Shift+9 { move-column-to-workspace 9; }

    // Mod+N { focus-workspace-down; }
    // Mod+P { focus-workspace-up; }
    Mod+N     { focus-column-right; }
    Mod+P     { focus-column-left; }
    Mod+Tab { focus-workspace-previous; }

    Mod+Shift+Tab { focus-monitor-next; }



    // others:
    // move {column|window|workspace} -> monitor
    // Mod+Shift+Ctrl+Left  { move-column-to-monitor-left; }
    // Mod+Shift+Ctrl+Left  { move-window-to-monitor-left; }
    // Mod+Shift+Ctrl+Left  { move-workspace-to-monitor-left; }

    // move {column|window|workspace} -> workspace
    // Mod+Ctrl+Page_Down { move-window-to-workspace-down; }
    // Mod+Ctrl+1 { move-window-to-workspace 1; }

    // Mod+Shift+Left  { focus-monitor-left; }







    //
    // WINDOW RESIZE
    //
    Mod+R { switch-preset-column-width; }
    Mod+Shift+R { switch-preset-window-height; }

    Mod+F { maximize-column; }
    Mod+Shift+F { fullscreen-window; }
    Mod+Ctrl+F { expand-column-to-available-width; }

    Mod+Minus { set-column-width "-10%"; }
    Mod+Equal { set-column-width "+10%"; }

    Mod+Shift+Minus { set-window-height "-10%"; }
    Mod+Shift+Equal { set-window-height "+10%"; }

    //
    // FLOATING MODE
    //
    Mod+V       { toggle-window-floating; }
    Mod+Shift+V { switch-focus-between-floating-and-tiling; }

    //
    // TAB MODE
    //
    Mod+W { toggle-column-tabbed-display; }

    //
    // MOUSE
    //
    Mod+WheelScrollDown      cooldown-ms=150 { focus-column-right; }
    Mod+WheelScrollUp        cooldown-ms=150 { focus-column-left; }
    Mod+Ctrl+WheelScrollDown cooldown-ms=150 { move-column-right; }
    Mod+Ctrl+WheelScrollUp   cooldown-ms=150 { move-column-left; }

    Mod+WheelScrollRight      { focus-workspace-down; }
    Mod+WheelScrollLeft       { focus-workspace-up; }
    Mod+Ctrl+WheelScrollRight { move-column-to-workspace-down; }
    Mod+Ctrl+WheelScrollLeft  { move-column-to-workspace-up; }

    // Usually scrolling up and down with Shift in applications results in
    // horizontal scrolling; these binds replicate that.
    Mod+Shift+WheelScrollDown      { focus-column-right; }
    Mod+Shift+WheelScrollUp        { focus-column-left; }
    Mod+Ctrl+Shift+WheelScrollDown { move-column-right; }
    Mod+Ctrl+Shift+WheelScrollUp   { move-column-left; }

    // Similarly, you can bind touchpad scroll "ticks".
    // Touchpad scrolling is continuous, so for these binds it is split into
    // discrete intervals.
    // These binds are also affected by touchpad's natural-scroll, so these
    // example binds are "inverted", since we have natural-scroll enabled for
    // touchpads by default.
    // Mod+TouchpadScrollDown { spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.02+"; }
    // Mod+TouchpadScrollUp   { spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.02-"; }

}
