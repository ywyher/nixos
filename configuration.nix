{ pkgs, inputs, user, stateVersion, ... }:
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./nixos/modules
    ];

	
  services.logrotate.enable = false;
	
  networking.hostName = user;

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [ home-manager spicetify-cli ghostty ];

  system.stateVersion = stateVersion;
}