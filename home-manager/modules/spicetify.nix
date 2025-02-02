{ config, pkgs, programs, inputs, ... }: {
  programs.spicetify =
    let
      spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
    in
    {
      enable = true;
      spotifyPackage = pkgs.spotify; # Explicitly specify the Spotify package
      enabledExtensions = with spicePkgs.extensions; [
       adblockify
       hidePodcasts
       shuffle # shuffle+ (special characters are sanitized out of extension names)
      ];
      theme = spicePkgs.themes.catppuccin;
      colorScheme = "mocha";
    };
}