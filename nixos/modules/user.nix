{ user, ... }: {
  users = {
    # here
    users.${user} = {
      isNormalUser = true;
      extraGroups = [ "wheel" "networkmanager" "docker" ];
      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIE96xNPyTlTWVtgId/gy3zZ1wfXyz3BexjhyRlPzXk1c yassienwyh0@gmail.com"
      ];
    };
  };
}
