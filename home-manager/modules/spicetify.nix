{ config, pkgs, inputs, system, ... }: {
  programs.spicetify = {
    enable = true;

    enabledExtensions = [
      ({
          src = pkgs.fetchFromGitHub {
            owner = "spicetify";
            repo = "cli";
            rev = "main";
            hash = "sha256-9rX3jifEmGL1ewiTu3DoUYI/u8Osl1wVSo+9yWH+J8I=";
          } + "/Extensions";

          name = "loopyLoop.js";
      })
      ({
          src = pkgs.fetchFromGitHub {
            owner = "spicetify";
            repo = "cli";
            rev = "main";
            hash = "sha256-9rX3jifEmGL1ewiTu3DoUYI/u8Osl1wVSo+9yWH+J8I=";
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
        hash = "sha256-2r4AbMber9VqQECKiYI/fKw+mJPhM6WmLVs0QscIaVs=";
      } + "/text";
    };
  };
}
