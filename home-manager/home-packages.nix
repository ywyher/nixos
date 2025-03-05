{ pkgs, inputs, system, ... }: {
    nixpkgs.config.allowUnfree = true;
    home.packages = with pkgs; [
        inputs.zen-browser.packages."${system}".default # beta

	sqlitebrowser
        kitty
        lshw
        firefox
        brightnessctl
        rofi-wayland
        rofi-screenshot
        mako
        pavucontrol
        anki
        nautilus
        flameshot
        qimgv
        papirus-icon-theme
        thunderbird
        swww
        zed-editor
        libreoffice-qt6
        hunspell
        btop
        vlc
        mpv
        ncmpcpp
    	lollypop
        unzip
    	telegram-desktop
        google-chrome
        youtube-music
        ytmdesktop
        yt-dlp
        speedtest-cli	
        obsidian
        gh
        scrcpy

        (discord.override {
            # withOpenASAR = true; # can do this here too
            withVencord = true;
        })

        polkit
        hyprpolkitagent
        hyprpicker
        hypridle
        hyprsunset
        hypridle
        hyprpaper
        hyprshot
        cliphist
        wl-clipboard

        home-manager

        nodejs
        bun
        pnpm
        jdk
        glxinfo
    ];
}
