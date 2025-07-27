{ config, pkgs, inputs, system, ... }: {
  programs.spicetify = {
    enable = true;

    enabledExtensions = [
      ({
          src = pkgs.fetchFromGitHub {
            owner = "spicetify";
            repo = "cli";
            rev = "main";
            hash = "sha256-JQePmLk1uYLdj1j2kIPzvEPQbPNpvav/tpR1v+YF4Mc=";
          } + "/Extensions";

          name = "loopyLoop.js";
      })
      ({
          src = pkgs.fetchFromGitHub {
            owner = "spicetify";
            repo = "cli";
            rev = "main";
            hash = "sha256-JQePmLk1uYLdj1j2kIPzvEPQbPNpvav/tpR1v+YF4Mc=";
          } + "/Extensions";

          name = "keyboardShortcut.js";
      })
      ({
          src = pkgs.fetchFromGitHub {
            owner = "rxri";
            repo = "spicetify-extensions";
            rev = "main";
            hash = "sha256-WwO5Ambn4c25KT+y52jvo+Nw4L68NvyIJGAsAWIKbnY=";
          } + "/adblock";

          name = "adblock.js";
      })
    ];

    theme = {
      name = "text";
      src = pkgs.fetchFromGitHub {
        owner = "spicetify";
        repo = "spicetify-themes";
        rev = "master";
        hash = "sha256-d6xxydORLenqRw6PLW8M9FnLHYj7k0ALUsDlm6jEW1M=";
      } + "/text";
    };
  };
}
