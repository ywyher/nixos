# Doesnt work without /home-manager/modules/virtualisation.nix

{ user, ... }: {
    users.groups.libvirtd.members = ["ywyh"];
    virtualisation.libvirtd.enable = true;
    virtualisation.spiceUSBRedirection.enable = true;
}