{ pkgs, user, ... }: {
    home.file = {
        "/home/${user}/.config/rofi/spotlight.rasi".text = ''
            /* MACOS SPOTLIGHT LIKE DARK THEME FOR ROFI  */
            /* Author: Newman Sanchez (https://github.com/newmanls) */

            * {
                font:   "Montserrat 12";

                bg0:    #242424E6;
                bg1:    #7E7E7E80;
                bg2:    #0860f2E6;

                fg0:    #DEDEDE;
                fg1:    #FFFFFF;
                fg2:    #DEDEDE80;

                background-color:   transparent;
                text-color:         @fg0;

                margin:     0;
                padding:    0;
                spacing:    0;
            }

            window {
                background-color:   @bg0;

                location:       center;
                width:          640;
                border-radius:  8;
            }

            inputbar {
                font:       "Montserrat 15";
                padding:    12px;
                spacing:    12px;
                children:   [ icon-search, entry ];
            }

            icon-search {
                expand:     false;
                filename:   "search";
                size: 28px;
            }

            icon-search, entry, element-icon, element-text {
                vertical-align: 0.5;
            }

            entry {
                font:   inherit;

                placeholder         : "Search";
                placeholder-color   : @fg2;
            }

            message {
                border:             2px 0 0;
                border-color:       @bg1;
                background-color:   @bg1;
            }

            textbox {
                padding:    8px 24px;
            }

            listview {
                lines:      10;
                columns:    1;

                fixed-height:   false;
                border:         1px 0 0;
                border-color:   @bg1;
            }

            element {
                padding:            8px 16px;
                spacing:            16px;
                background-color:   transparent;
            }

            element normal active {
                text-color: @bg2;
            }

            element alternate active {
                text-color: @bg2;
            }

            element selected normal, element selected active {
                background-color:   rgba(138, 138, 138, 0.3);
                text-color:         @fg1;
            }

            element-icon {
                size:   1em;
            }

            element-text {
                text-color: inherit;
            }
        '';
    };

    home.packages = with pkgs; [
        rofi-wayland
    ];
}