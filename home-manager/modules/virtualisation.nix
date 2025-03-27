{ pkgs, ... }: {
    home.packages = with pkgs; [
        virt-manager
    ];

    # fix this error
    # authentication unavailable: no polkit agent available to authenticate action 'org.libvirt.unix.manage'
    dconf.settings = {
        "org/virt-manager/virt-manager/connections" = {
            autoconnect = ["qemu:///system"];
            uris = ["qemu:///system"];
        };
    };
}