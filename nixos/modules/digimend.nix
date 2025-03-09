{ config, ... }: {
  services.xserver.digimend.enable = true;

  boot.extraModulePackages = with config.boot.kernelPackages; [ 
    (digimend.overrideAttrs (old: {
      version = "newer-version";
      src = pkgs.fetchFromGitHub {
        owner = "DIGImend";
        repo = "digimend-kernel-drivers";
        rev = "newer-commit-hash";
        sha256 = "0jih328qj8yklhcgs4cwslxhmpf6z7ln1xfskwvv9kjz4bfn6hp6";
      };
    }))
  ];
}