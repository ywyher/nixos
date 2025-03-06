{ config, pkgs, ... }: {
  programs.bash = {
    enable = true;

   # initExtra = ''
   #   # Start UWSM
   #   if uwsm check may-start; then
   #       exec uwsm start hyprland.desktop
   #   fi
   # '';
  };
}