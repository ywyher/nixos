{ config, user, lib, pkgs, ... }:

let
  script = ''
    #!/bin/bash

    zen &

    # Dictionary indexer
    cd ~/Development/Projects/better-melon-dictionary-indexer || exit

    notify-send "Starting Better melon dictionary indexer services through docker"
    docker compose -f docker.yaml up -d --wait
    notify-send "Better melon dictionary indexer services is up and running!"

    ghostty -e "bash -c 'cd ~/Development/Projects/better-melon-dictionary-indexer && bun run build'" &

    # API
    cd ~/Development/Projects/better-melon-api || exit

    notify-send "Starting Better melon API services through docker"
    docker compose -f docker.yaml up -d --wait
    notify-send "Better melon API services is up and running!"

    ghostty -e "bash -c 'cd ~/Development/Projects/better-melon-api && bun run dev'" &

    # Proxy
    ghostty -e "bash -c 'cd ~/Development/Projects/shrina-proxy/ && pnpm run dev'" &

    # Main APP
    cd ~/Development/Projects/better-melon || exit

    notify-send "Starting Better melon services through docker"
    docker compose -f docker.yaml up -d --wait
    notify-send "Better melon services is up and running!"

    ghostty -e "bash -c 'cd ~/Development/Projects/better-melon && pnpm run dev'" &
    ghostty -e "bash -c 'cd ~/Development/Projects/better-melon && pnpm studio'" &

    code .
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