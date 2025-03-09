{ pkgs, ... }: {
    services.displayManager.sddm = {
        enable = true;
        wayland = {
            enable = true;
        };

        theme = "where-is-my-sddm-theme"; # No working this is wrong
    };
}