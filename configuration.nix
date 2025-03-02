{ pkgs, inputs, ... }:
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./nixos/modules
    ];

  networking.hostName = "ywyh";

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = [ pkgs.home-manager pkgs.spicetify-cli ];

  system.stateVersion = "24.11";
}