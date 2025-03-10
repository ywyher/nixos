{ pkgs, ... }: {
  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 16;
  };

  gtk = {
    enable = true;

    theme = {
      package = pkgs.adw-gtk3;
      name = "adw-gtk3-dark"; # Ensures a dark variant
    };

    iconTheme = {
      package = pkgs.tela-icon-theme;
      name = "Tela-dark";
    };

    font = {
      name = "JetBrains Mono";
      size = 11;
    };
  };
  
  qt = {
    enable = true;
    # Using platformTheme.name doesnt work although they say it renamed to that weird
    platformTheme.name = "gtk";  # Makes Qt apps follow GTK theme
    
    # style = {
    #   package = pkgs.adwaita-qt;  # Alternative: pkgs.breeze
    #   name = "adwaita-dark";  # Change to "adwaita" for light mode
    # };
  };
}