{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.configurationLimit = 3;

  # Nvidia
  boot.initrd.kernelModules = [ "nvidia" ];
  boot.blacklistedKernelModules = ["nouveau"];
}