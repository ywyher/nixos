{ pkgs, inputs, user, stateVersion, uwsm, ... }:
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./nixos/modules
    ];

	
  services.logrotate.enable = false;
	
  networking.hostName = user;

  nixpkgs.config.allowUnfree = true;

  services.xserver.desktopManager.runXdgAutostartIfNone = true;

  environment.systemPackages = with pkgs; [ 
    home-manager 
    spicetify-cli 
    ghostty
    gnumake 
    gcc
  ];

  system.stateVersion = stateVersion;
}