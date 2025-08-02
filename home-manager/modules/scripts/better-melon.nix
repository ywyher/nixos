{ config, user, lib, pkgs, ... }:

let
  script = ''
    #!/bin/bash

    zen &

    cd ~/Development/Projects/better-melon || exit

    notify-send "Starting Better melon services through docker"
    docker compose -f docker.yaml up -d --wait
    notify-send "Better melon services is up and running!"

    kitty -e bash -c "cd \"$HOME/Development/Projects/better-melon\" && turbo run dev --filter=web --filter=api --filter=shinra" &

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