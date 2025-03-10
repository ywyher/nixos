{ pkgs, lib, ... }: {
  boot = {
    plymouth = {
      enable = true;
      logo = "${pkgs.nixos-icons}/share/icons/hicolor/48x48/apps/nix-snowflake-white.png";
      
      # Use these settings directly in the Plymouth module
      extraConfig = ''
        ShowDelay=0
        DeviceTimeout=5
        QuietBootEnable=true
      '';
    };
    
    # Silent Boot
    consoleLogLevel = 0;
    initrd.verbose = false;
    
    kernelParams = [
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "loglevel=3"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
      "vt.global_cursor_default=0"
      "plymouth.ignore-serial-consoles"
      "plymouth.enable=1"
      "i915.modeset=1"
      "nvidia-drm.modeset=1"
      "fbcon=nodefer"
      "video=efifb:off"
    ];
    
    initrd.kernelModules = [ "i915" "nvidia" "nvidia_modeset" "nvidia_uvm" "nvidia_drm" ];
    initrd.systemd.enable = true;
  };
}