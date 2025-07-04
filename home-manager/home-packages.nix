
{ pkgs, inputs, system, ... }: {
    nixpkgs.config.allowUnfree = true;
    
    home.packages = with pkgs; [
	    extundelete
        xorg.xeyes
        biome
        lunar-client
        gimp
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
        zip
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
        inkscape

        polkit
        usbutils
        hyprpolkitagent
        hyprpicker
        hypridle
        hyprsunset
        hypridle
        hyprpaper
        hyprshot
        qbittorrent-enhanced
        ffmpeg
        wl-clipboard
        identity

        xsel
        lsof
        jq
        cloc
  	    go
	    nodejs
	    yarn
        bun
        python3
        pnpm
        rustc # check rustup later
        cargo
        gnumake 
        gcc
    	redis
	    redisinsight

        usbutils
        simple-mtpfs
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