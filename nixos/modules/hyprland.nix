{ uwsm, ... }: {
  programs.hyprland = {
    enable = true;
    withUWSM = uwsm;
  };

  security.pam.services.hyprlock = {};
}