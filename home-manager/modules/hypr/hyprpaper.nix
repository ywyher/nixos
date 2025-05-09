{ user, ... }: {
  services.hyprpaper = let
    okarinStare = "/home/${user}/Pictures/Wallpapers/anime/steins;gate/vn/okarin-stare.png";
    makimaRyuk = "/home/${user}/Pictures/Wallpapers/anime/chainsaw/makima-ryuk.png";
    kuriseNewspaper = "/home/${user}/Pictures/Wallpapers/anime/steins;gate/vn/kurise-newspaper.png";
    kuriseDeath = "/home/${user}/Pictures/Wallpapers/anime/steins;gate/vn/kurisu-death.png";
    fiveCmTrainStation = "/home/${user}/Pictures/Wallpapers/anime/5cm-per-second/train-station.jpg";
  in {
    enable = true;

    settings = {
      ipc = "on";
      splash = false;
      splash_offset = 2.0;

      preload = [
        okarinStare
        makimaRyuk
        kuriseDeath
        kuriseNewspaper
        fiveCmTrainStation
      ];

      wallpaper = [
        ",${fiveCmTrainStation}"
      ];
    };
  };
}