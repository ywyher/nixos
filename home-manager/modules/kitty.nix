{ ... }: {
  programs.kitty = {
    enable = true;

    font = {
      name = "FiraCode Nerd Font";
      size = 13;
    };

    themeFile = "Brogrammer";
  };
}