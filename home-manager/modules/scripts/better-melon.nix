{ config, user, lib, pkgs, ... }:

let
  script = ''
    #!/bin/bash

    zen &

    # Dictionary indexer
    cd ~/Development/Projects/better-melon-dictionary-indexer || exit

    docker compose -f docker.yaml up -d --wait

    ghostty -e "bash -c 'cd ~/Development/Projects/better-melon-dictionary-indexer && bun run build'" &

    # API
    cd ~/Development/Projects/better-melon-api || exit

    docker compose -f docker.yaml up -d --wait

    ghostty -e "bash -c 'cd ~/Development/Projects/better-melon-api && bun run dev'" &

    # Proxy
    ghostty -e "bash -c 'cd ~/Development/Projects/shrina-proxy/ && pnpm run dev'" &

    # Main APP
    cd ~/Development/Projects/better-melon || exit

    code .

    docker compose -f docker.yaml up -d --wait

    ghostty -e "bash -c 'cd ~/Development/Projects/better-melon && pnpm run dev'" &
  '';
in {
  home.file."${config.home.homeDirectory}/Scripts/better-melon.sh" = {
    text = script;
    executable = true;
  };

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