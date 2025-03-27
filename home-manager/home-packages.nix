
{ pkgs, inputs, system, ... }: {
    nixpkgs.config.allowUnfree = true;
    home.packages = with pkgs; [
        inputs.zen-browser.packages."${system}".default # beta

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
        ncmpcpp
        unzip
	    unrar
    	telegram-desktop
        google-chrome
        youtube-music
        speedtest-cli	
        obsidian
	    scrcpy
        postman
        obs-studio
        siyuan
        goldendict-ng
        mongodb-compass
	
	    libreoffice
        hunspell # spell check for libreoffice

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
        subtitleedit
        qbittorrent-enhanced
        ffmpeg

        nodejs
        bun
        python3
        pnpm
        rustc # check rustup later
        cargo
    
    	glxinfo
        libnotify
        heroic
        lutris
        superTuxKart # free racing 3rd game to test shit
	    gamemode
        evtest
        libinput

        wineWowPackages.waylandFull
        winetricks
    ];
}
