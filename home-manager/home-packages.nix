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
        swww
        zed-editor
        btop
        vlc
        mpv
        ncmpcpp
        unzip
    	telegram-desktop
        google-chrome
        youtube-music
        ytmdesktop
        speedtest-cli	
        obsidian
        gh
        scrcpy
        postman
        obs-studio

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

        # Wine and related packages
        winetricks
        wineWowPackages.stable  # For 64-bit support
        # wineWowPackages.waylandFull # Expremintal

        osu-lazer-bin
    ];
}