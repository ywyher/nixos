{ config, pkgs, user, stateVersion, uwsm, ... }: 
{
  imports = [
    ./home-packages.nix
    ./modules
  ]; 

  home = {
    username = user;
    homeDirectory = "/home/${user}";
    stateVersion = "24.11";
  };

  programs.home-manager.enable = true;

  programs.java = {
    enable = true;
    package = pkgs.jdk;
  };
}