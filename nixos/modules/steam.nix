{ config, pkgs, ... }:
{
  boot.kernelPackages = pkgs.linuxPackages;

  # Enable Steam
  programs = {
    gamescope = {
      enable = true;
      # capSysNice = true;
    };

    steam = {
      enable = true;
      remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
      dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
      localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers

      # gamescopeSession.enable = true;
    };
  };

  # Install necessary packages
  environment.systemPackages = with pkgs; [
    steam
    steam-run
    mangohud
    protonup-qt
  ];
}