{ pkgs, config, ... }: {
    boot = {
        plymouth = {
            enable = true;
        };

        kernelParams = [ "quiet" "splash" ]; # Hide boot logs
    };
}