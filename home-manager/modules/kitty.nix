{ ... }: {
  programs.kitty = {
    enable = true;

    font = {
      name = "FiraCode Nerd Font";
      size = 16;
    };

    themeFile = "Brogrammer";
  };
}