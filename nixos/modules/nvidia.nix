{ config, pkgs, ... }:
{
  # Enable the Xorg Xserver
  services.xserver.enable = true;
  # Load Nvidia driver for Xorg and Wayland
  services.xserver.videoDrivers = ["nvidia"];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      rocmPackages.clr
    ];
  };

  hardware.nvidia = {
    # Modesetting is required.
    modesetting.enable = true;

    powerManagement.enable = false;

    powerManagement.finegrained = false;

    open = false;

    nvidiaSettings = true;

    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  hardware.nvidia.prime = {
    # PRIME Sync and Offload Mode cannot be enabled at the same time.
    offload = {
      enable = true;
      enableOffloadCmd = true;
    };
    # sync.enable = true;

    intelBusId = "PCI:0:2:0";
    nvidiaBusId = "PCI:1:0:0";
  };

  environment.systemPackages = [
    pkgs.nvidia-vaapi-driver
    pkgs.clinfo # to verify if you have OpenGL properly set up
    pkgs.vulkan-tools
  ];
}
