{ uwsm, lib, ... }: let
  env = {
    main = [
      "XCURSOR_SIZE=24"
      "NIXOS_OZONE_WL=1"
      "LIBVA_DRIVER_NAME=nvidia"
      "__GLX_VENDOR_LIBRARY_NAME=nvidia"
      "NVD_BACKEND=direct"
    ];
    hyprland = [
      "HYPRCURSOR_SIZE=24"
    ];
  };
  env.full = env.main ++ env.hyprland;
  
  getEnv = { hyprland ? false}:
    let 
      selectedEnv = if !hyprland then env.main else env.hyprland;
    in 
      builtins.concatStringsSep "\n" (map (e: "export " + e) selectedEnv);
in {
  # If uwsm is true, write environment variables to files with "export " prefix
  home.file = lib.mkIf uwsm {
    # For theming, xcursor, nvidia and toolkit variables
    ".config/uwsm/env".text = getEnv {};
    # For HYPR* and AQ_* variables
    ".config/uwsm/env-hyprland".text = getEnv { hyprland = true; };
  };
  
  # If uwsm is false, define env as a list (no change needed here)
  wayland.windowManager.hyprland.settings = {
    env = lib.mkIf (!uwsm) env.full;
  };
}