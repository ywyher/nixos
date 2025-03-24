{ config, user, lib, pkgs, ... }:

let
  erpScript = ''
    #!/bin/bash

    # Run Zen Browser
    zen &

    # Open Thunderbird
    thunderbird &

    # Navigate to the ERP project directory
    cd ~/Development/Projects/erp || exit

    # Open the project in VS Code
    code .

    # Check if the ERP container is already running
    if ! docker ps | grep -q "erp"; then
        echo "Starting Docker containers..."
        docker compose -f ./docker-compose.yml up -d
        
        # Wait for Docker containers to be ready
        echo "Waiting for containers to be ready..."
        sleep 5
    fi

    # Open new Ghostty instances in the background
    ghostty -e "bash -c 'cd ~/Development/Projects/erp && pnpm run dev'" &  
    ghostty -e "bash -c 'cd ~/Development/Projects/erp && pnpm run db:studio'" &  

    echo "ERP development environment is now ready!"
  '';
in {
  # Store the script in ~/Scripts/erp.sh
  home.file."${config.home.homeDirectory}/Scripts/erp.sh" = {
    text = erpScript;
    executable = true;
  };

  # Create a .desktop file for Rofi and app launchers
  home.file.".local/share/applications/erp.desktop" = {
    text = ''
      [Desktop Entry]
      Name=Run ERP
      Comment=Launch ERP development environment
      Exec=bash ${config.home.homeDirectory}/Scripts/erp.sh
      Icon=utilities-terminal
      Terminal=false
      Type=Application
      Categories=Development;
    '';
  };
}