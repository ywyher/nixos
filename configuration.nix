{ pkgs, inputs, user, stateVersion, ... }:
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./nixos/modules
    ];

	
  services.logrotate.enable = false;
	
  networking.hostName = "ywyh";

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [ home-manager spicetify-cli ];

  system.stateVersion = "24.11";

  # services.displayManager.sddm.enable = true;

}
