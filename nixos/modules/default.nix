{
  imports = [
    ./boot.nix
    ./bluetooth.nix
    ./greetd.nix
    ./hyprland.nix
    ./net.nix
    ./nix.nix
    ./nvidia.nix
    ./timezone.nix
    ./user.nix
    ./i18n.nix
    ./fonts.nix
    ./docker.nix
    ./steam.nix
    ./automount.nix
    ./plymouth.nix
    ./env.nix
    ./flatpak.nix
    ./virtualisation.nix
    # Doesnt work with current kernel for whatever
    # ./digimend.nix
  ];
}
