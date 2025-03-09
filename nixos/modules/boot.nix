{ pkgs, config, ... }: {
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.configurationLimit = 3;

  boot.kernelPackages = pkgs.linuxPackages_zen;

  # Nvidia
  boot.initrd.kernelModules = [ "nvidia" ];
  boot.blacklistedKernelModules = ["nouveau"];
  
  # Enable the xpadneo driver
  boot.extraModulePackages = with config.boot.kernelPackages; [ xpadneo ];
  boot.kernelModules = [ "hid_xpadneo" ];
}