{ config, pkgs, inputs, system, ... }:
{
  programs.spicetify =
  let
    spicePkgs = inputs.spicetify-nix.legacyPackages.${system};
  in
  {
    enable = true;

    enabledExtensions = with spicePkgs.extensions; [
      adblock
    ];

    theme = spicePkgs.themes.hazy;
  };
}