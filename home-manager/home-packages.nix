
{ pkgs, inputs, system, ... }: {
    nixpkgs.config.allowUnfree = true;
    home.packages = with pkgs; [
        inputs.zen-browser.packages."${system}".default

	google-chrome
        xorg.xeyes
        biome
        lunar-client
        gimp
        vivaldi
        kitty
        lshw
        brightnessctl
        mako
        pavucontrol
        anki
        nautilus
        qimgv
        papirus-icon-theme
        thunderbird
        btop
        vlc
        mpv
        unzip
        unrar
    	telegram-desktop
        youtube-music
        speedtest-cli	
        obsidian
        scrcpy
        postman
        obs-studio
        mongodb-compass
  	gh	
  	libreoffice
        hunspell # spell check for libreoffice
	yt-dlp
	tree

        vesktop
         (discord.override {
             # withOpenASAR = true; # can do this here too
             withVencord = true;
         })


        polkit
        usbutils
        hyprpolkitagent
        hyprpicker
        hypridle
        hyprsunset
        hypridle
        hyprpaper
        hyprshot
        cliphist
        wl-clipboard
        qbittorrent-enhanced
        ffmpeg

  	go
  	nodejs
        bun
        python3
        pnpm
        rustc # check rustup later
        cargo
        gnumake 
        gcc
    
    	glxinfo
        libnotify
        heroic
        lutris
        gamemode
        evtest
        libinput

        wineWowPackages.waylandFull
        winetricks
    ];
}
