{ config, user, lib, pkgs, ... }:

let
  script = ''
    #!/bin/bash

    zen &

    cd ~/Development/Projects/better-melon || exit

    code .

    ghostty -e "bash -c 'cd ~/Development/Projects/better-melon && pnpm run dev'" &

    cd ~/Development/Projects/better-melon-mapper || exit

    code .

    ghostty -e "bash -c 'cd ~/Development/Projects/better-melon-mapper && bun run dev'" &

    docker compose -f docker.yaml up -d &

    cd ~/Development/Git/shinra-proxy/ || exit

    ghostty -e "bash -c 'cd ~/Development/Projects/shinra-proxy/ && pnpm run dev'" &

    echo "better-melon development environment is now ready!"
 
  '';
in {
  # Store the script in ~/Scripts/erp.sh
  home.file."${config.home.homeDirectory}/Scripts/better-melon.sh" = {
    text = script;
    executable = true;
  };

  # Create a .desktop file for Rofi and app launchers
  home.file.".local/share/applications/better-melon.desktop" = {
    text = ''
      [Desktop Entry]
      Name=Better melon
      Comment=Launch better-melon development environment
      Exec=bash ${config.home.homeDirectory}/Scripts/better-melon.sh
      Icon=utilities-terminal
      Terminal=false
      Type=Application
      Categories=Development;
    '';
  };
}