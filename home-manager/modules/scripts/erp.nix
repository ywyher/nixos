{ config, lib, pkgs, ... }:

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
  home.file."Scripts/erp.sh" = {
    text = erpScript;
    executable = true;
  };
}