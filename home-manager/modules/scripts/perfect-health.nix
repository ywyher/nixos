{ config, user, lib, pkgs, ... }:

let
  perfectHealthScript = ''
    #!/bin/bash

    zen &

    notify-send "Launching Thunderbird"
    thunderbird &

    cd ~/Development/Projects/perfect-health || exit

    notify-send "Starting Perfect Health Docker services..."
    docker compose -f ./compose.yml up -d --wait
    notify-send "Perfect Health Docker services are up and running!"

    notify-send "Starting Perfect Health Dev Server..."
    kitty -e bash -c "cd \"$HOME/Development/Projects/perfect-health\" && pnpm run dev" &  

    notify-send "Opening Prisma Studio..."
    kitty -e bash -c "cd \"$HOME/Development/Projects/perfect-health\" && pnpm run db:studio" &  

    code .

    notify-send "Perfect Health development environment is now ready!"
  '';
in {
  home.file."${config.home.homeDirectory}/Scripts/perfect-health.sh" = {
    text = perfectHealthScript;
    executable = true;
  };

  home.file.".local/share/applications/perfect-health.desktop" = {
    text = ''
      [Desktop Entry]
      Name=Run Perfect Health
      Comment=Launch perfect health development environment
      Exec=bash ${config.home.homeDirectory}/Scripts/perfect-health.sh
      Icon=utilities-terminal
      Terminal=false
      Type=Application
      Categories=Development;
    '';
  };
}