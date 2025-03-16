{ user, ... }: {
  users = {
    # here
    users.${user} = {
      isNormalUser = true;
      extraGroups = [ "wheel" "networkmanager" "docker" ];
      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINMpUNSvfMDDK3acTRRdIyzVX5oBf/EN3TbR3a4wg7uS yassienwyh0@gmail.com"
      ];
    };
  };
}