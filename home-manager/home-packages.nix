{ pkgs, ... }: {
    nixpkgs.config.allowUnfree = true;

    home.packages = with pkgs; [
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
        gamescope
        mangohud
        dolphin
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
    ];
}
