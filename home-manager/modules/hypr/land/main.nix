{
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = false;

    # set the Hyprland and XDPH packages to null to use the ones from the NixOS module
    # Avoid conflicts since we have hyprland installed through nixos config and home manager at the same time
    package = null;
    portalPackage = null;

    settings = {
        monitor = ",1920x1080@60,auto,1";

        "$mainMod" = "SUPER";
        "$terminal" = "kitty";
        "$fileManager" = "nautilus -w";
        "$menu" = "rofi -show drun -theme ~/.config/rofi/spotlight.rasi -icon-theme 'Tela' -show-icons";
        "$dir" = "/home/ywyh/nixos";

        exec-once = [
            # "swww-daemon"
            "udiskie"
            "hyprpaper"
            "hypridle"
            "systemctl --user start hyprpolkitagent"
            "wl-paste --type text --watch cliphist store" # Stores only text data
            "wl-paste --type image --watch cliphist store" # Stores only image data
        ];
        
        general = {
            gaps_in = 1;
            gaps_out = 4;

            border_size = 2;

            "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
            "col.inactive_border" = "rgba(595959aa)";

            resize_on_border = false;

            allow_tearing = false;

            layout = "dwindle";
        };

        decoration = {
            rounding = 8;

            active_opacity = "1.0";
            inactive_opacity = "1.0";

            shadow = {
                enabled = false;
                range = 4;
                render_power = 3;
                color = "rgba(1a1a1aee)";
            };

            blur = {
                enabled = false;
                size = 3;
                passes = 1;
                vibrancy = "0.1696";
            };
        };

        animations = {
            enabled = true;

            bezier = [
                "fastInOut, 0.25, 1, 0.5, 1"
                "snappy, 0.15, 0.85, 0.4, 1.15"
                "easeOut, 0.2, 0.9, 0.3, 1"
            ];

            animation = [
                "windows, 1, 1, fastInOut"
                "windowsOut, 1, 1, easeOut, popin 70%"
                "border, 1, 1, snappy"
                "borderangle, 1, 1, easeOut"
                "fade, 1, 1, easeOut"
                "workspaces, 1, 1, fastInOut"
            ];
        };

        
        dwindle = {
            pseudotile = true;
            preserve_split = true;
        };

        master = {
            new_status = "master";
        };

        misc = {
            vfr = true;
	    force_default_wallpaper = 0; # Set to 0 or 1 to disable the anime mascot wallpapers
            disable_hyprland_logo = true; # If true disables the random hyprland logo / anime girl background. :(
        };

        input = {
            kb_layout = "us";

            follow_mouse = 1;
            sensitivity = 0; # -1.0 - 1.0, 0 means no modification.
            touchpad = {
                natural_scroll = false;
            };
        };

        gestures = {
            workspace_swipe = false;
        };

        device = {
            name = "epic-mouse-v1";
            sensitivity = -0.5;
        };

        
        windowrulev2 = [
            "suppressevent maximize, class:.*"
            "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
        ];
    };
  };
}
