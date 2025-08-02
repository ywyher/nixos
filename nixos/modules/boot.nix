{ pkgs, config, ... }: {
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.configurationLimit = 3;
  boot.kernelPackages = pkgs.linuxPackages_zen;

  boot.initrd.kernelModules = [ 
    "nvidia"
  ];
  boot.blacklistedKernelModules = ["nouveau"];
}