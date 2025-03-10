{
  services.hyprpaper = let
    okarinStare = "/home/ywyh/Pictures/Wallpapers/anime/steins;gate/okarin-stare.png";
    makimaRyuk = "/home/ywyh/Pictures/Wallpapers/anime/chainsaw/makima-ryuk.png";
  in {
    enable = true;

    settings = {
      ipc = "on";
      splash = false;
      splash_offset = 2.0;

      preload = [
        okarinStare
        makimaRyuk
      ];

      # wallpaper = [
      #   ",${okarinStare}"
      # ];
    };
  };
}
