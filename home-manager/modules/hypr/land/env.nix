{ uwsm, lib, ... }: let
  env = { operation ? "=" }: {
    main = [
      # Nvidia settings
      "LIBVA_DRIVER_NAME${operation}nvidia"
      "GBM_BACKEND${operation}nvidia-drm"
      "__GLX_VENDOR_LIBRARY_NAME${operation}nvidia"
      "NVD_BACKEND${operation}direct"

      # Flatpak
      "XDG_DATA_DIRS${operation}/var/lib/flatpak/exports/share:$HOME/.local/share/flatpak/exports/share:$XDG_DATA_DIRS"

      # Using it here makes startup duration for electron apps so fucking slow so we set it in nixos config
      # "NIXOS_OZONE_WL${operation}1"
    ];
    hyprland = [
      "HYPRCURSOR_SIZE${operation}24"
    ];
  };

  envConfig = env { operation = if uwsm then "=" else ","; };

  getEnv = { hyprland ? false }: 
  let
    selectedEnv = if !hyprland then envConfig.main else envConfig.hyprland;
  in
    builtins.concatStringsSep "\n" (map (e: "export " + e) selectedEnv);

in {
  home.file = lib.mkIf uwsm {
    ".config/uwsm/env".text = getEnv {};
    ".config/uwsm/env-hyprland".text = getEnv { hyprland = true; };
  };

  wayland.windowManager.hyprland.settings = {
    env = lib.mkIf (!uwsm) (envConfig.main ++ envConfig.hyprland);
  };
}