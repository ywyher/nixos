{ pkgs, ... }: {
  # Select internationalisation properties.
  i18n = {
    defaultLocale = "en_US.UTF-8";

    supportedLocales = [ 
      "en_US.UTF-8/UTF-8"
    ];

    extraLocaleSettings = {
      LC_ADDRESS = "en_US.UTF-8";
      LC_IDENTIFICATION = "en_US.UTF-8";
      LC_MEASUREMENT = "en_US.UTF-8";
      LC_MONETARY = "en_US.UTF-8";
      LC_NAME = "en_US.UTF-8";
      LC_NUMERIC = "en_US.UTF-8";
      LC_PAPER = "en_US.UTF-8";
      LC_TELEPHONE = "en_US.UTF-8";
      LC_TIME = "en_US.UTF-8";
    };

    inputMethod = {
      enable = true;
      type = "fcitx5";
      fcitx5.addons = with pkgs; [
        fcitx5-mozc # japanese input method
        fcitx5-gtk # gtk im module
      ];
    };
  };
}