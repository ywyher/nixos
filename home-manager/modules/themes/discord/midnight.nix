{ config, user, lib, pkgs, ... }:

let
  theme = ''
    /**
      * @name midnight-custom
      * @description a darker, customized version of the midnight discord theme with transparency and background image.
      * @author refact0r (modified)
      * @version 2.1.1
      * @invite nz87hXyvcy
      * @website https://github.com/refact0r/midnight-discord
      * @source https://github.com/refact0r/midnight-discord/blob/master/themes/midnight.theme.css
      * @authorId 508863359777505290
      * @authorLink https://www.refact0r.dev
    */

    /* import theme modules */
    @import url('https://refact0r.github.io/midnight-discord/build/midnight.css');

    body {
        /* font options */
        --font: 'figtree'; /* change to for default discord font */
        --code-font: ""; /* change to for default discord font */
        font-weight: 400; /* normal text font weight. DOES NOT AFFECT BOLD TEXT */

        /* sizes */
        --gap: 12px; /* spacing between panels */
        --divider-thickness: 4px; /* thickness of unread messages divider and highlighted message borders */
        --border-thickness: 1px; /* thickness of borders around main panels. DOES NOT AFFECT OTHER BORDERS */

        /* animation/transition options */
        --animations: on; /* off: disable animations/transitions, on: enable animations/transitions */
        --list-item-transition: 0.2s ease; /* transition for list items */
        --dms-icon-svg-transition: 0.4s ease; /* transition for the dms icon */
        --border-hover-transition: 0.2s ease; /* transition for borders when hovered */

        /* top bar options */
        --top-bar-height: var(--gap); /* height of the top bar */
        --top-bar-button-position: titlebar; /* move inbox button to titlebar */
        --top-bar-title-position: off; /* default centered position */
        --subtle-top-bar-title: off; /* default */

        /* window controls */
        --custom-window-controls: off; /* default window controls */
        --window-control-size: 14px; /* size of custom window controls */

        /* dms button options */
        --custom-dms-icon: custom; /* use custom icon */
        --dms-icon-svg-url: url('https://upload.wikimedia.org/wikipedia/commons/c/c4/Font_Awesome_5_solid_moon.svg'); /* icon svg url */
        --dms-icon-svg-size: 90%; /* size of the svg */
        --dms-icon-color-before: var(--icon-secondary); /* normal icon color */
        --dms-icon-color-after: var(--white); /* icon color when button is hovered/selected */
        --custom-dms-background: off; /* disable custom background */
        --dms-background-image-url: url(""); /* url of the background image */
        --dms-background-image-size: cover; /* size of the background image */
        --dms-background-color: linear-gradient(70deg, var(--blue-2), var(--purple-2), var(--red-2)); /* fixed color/gradient */

        /* background image options */
        --background-image: on; /* enable background image */
        --background-image-url: var(--bg-creepy-mita); /* url of the background image */

        /* transparency/blur options - ENABLED */
        --transparency-tweaks: on; /* enable transparency tweaks */
        --remove-bg-layer: off; /* keep the base layer */
        --panel-blur: on; /* enable panel blur */
        --blur-amount: 6px; /* moderate blur amount */
        --bg-floating: hsla(220, 15%, 10%, 0.85); /* more opaque color for floating panels */

        /* chatbar options */
        --custom-chatbar: aligned; /* aligned chatbar */
        --chatbar-height: 47px; /* height of the chatbar */
        --chatbar-padding: 8px; /* padding of the chatbar */

        /* other options */
        --small-user-panel: on; /* smaller user panel like in old discord */
    }

    /* color options */
    :root {
        --colors: on; /* use midnight custom colors */

        /* text colors - slightly adjusted for darker theme */
        --text-0: var(--bg-4); /* text on colored elements */
        --text-1: hsl(220, 45%, 92%); /* other normally white text */
        --text-2: hsl(220, 25%, 65%); /* headings and important text */
        --text-3: hsl(218, 14%, 73%); /* normal text */
        --text-4: hsl(220, 15%, 38%); /* icon buttons and channels */
        --text-5: hsl(215, 14%, 66%); /* muted channels/chats and timestamps */

        /* background and dark colors - DARKENED with transparency for panels */
        --bg-1: hsla(220, 15%, 18%, 0.9); /* dark buttons when clicked */
        --bg-2: hsla(220, 15%, 14%, 0.85); /* dark buttons */
        --bg-3: hsla(220, 15%, 11%, 0.8); /* spacing, secondary elements */
        --bg-4: hsla(220, 15%, 8%, 0.75); /* main background color */
        --hover: hsla(221, 19%, 38%, 0.12); /* channels and buttons when hovered */
        --active: hsla(220, 19%, 38%, 0.22); /* channels and buttons when clicked or selected */
        --active-2: hsla(220, 19%, 38%, 0.32); /* extra state for transparent buttons */
        --message-hover: hsla(220, 0%, 0%, 0.12); /* messages when hovered */

        /* accent colors */
        --accent-1: var(--blue-1); /* links and other accent text */
        --accent-2: var(--blue-2); /* small accent elements */
        --accent-3: var(--blue-3); /* accent buttons */
        --accent-4: var(--blue-4); /* accent buttons when hovered */
        --accent-5: var(--blue-5); /* accent buttons when clicked */
        --accent-new: var(--accent-2); /* stuff that's normally red like mute/deafen buttons */
        --mention: linear-gradient(to right, color-mix(in hsl, var(--accent-2), transparent 90%) 40%, transparent); /* background of messages that mention you */
        --mention-hover: linear-gradient(to right, color-mix(in hsl, var(--accent-2), transparent 95%) 40%, transparent); /* background of messages that mention you when hovered */
        --reply: linear-gradient(to right, color-mix(in hsl, var(--text-3), transparent 90%) 40%, transparent); /* background of messages that reply to you */
        --reply-hover: linear-gradient(to right, color-mix(in hsl, var(--text-3), transparent 95%) 40%, transparent); /* background of messages that reply to you when hovered */

        /* status indicator colors */
        --online: var(--green-2); /* online status */
        --dnd: var(--red-2); /* do not disturb status */
        --idle: var(--yellow-2); /* idle status */
        --streaming: var(--purple-2); /* streaming status */
        --offline: var(--text-4); /* offline status */

        /* border colors */
        --border-light: var(--hover); /* general light border color */
        --border: var(--active); /* general normal border color */
        --border-hover: var(--active); /* border color of panels when hovered */
        --button-border: hsl(220, 0%, 100%, 0.1); /* neutral border color of buttons */

        /* base colors - slightly darkened */
        --red-1: oklch(72% 0.12 0);
        --red-2: oklch(67% 0.12 0);
        --red-3: oklch(62% 0.12 0);
        --red-4: oklch(57% 0.12 0);
        --red-5: oklch(52% 0.12 0);

        --green-1: oklch(72% 0.11 170);
        --green-2: oklch(67% 0.11 170);
        --green-3: oklch(62% 0.11 170);
        --green-4: oklch(57% 0.11 170);
        --green-5: oklch(52% 0.11 160);

        --blue-1: oklch(72% 0.1 215);
        --blue-2: oklch(67% 0.1 215);
        --blue-3: oklch(62% 0.1 215);
        --blue-4: oklch(57% 0.1 215);
        --blue-5: oklch(52% 0.1 215);

        --yellow-1: oklch(77% 0.11 90);
        --yellow-2: oklch(72% 0.11 90);
        --yellow-3: oklch(67% 0.11 90);
        --yellow-4: oklch(62% 0.11 90);
        --yellow-5: oklch(57% 0.11 90);

        --purple-1: oklch(72% 0.11 310);
        --purple-2: oklch(67% 0.11 310);
        --purple-3: oklch(62% 0.11 310);
        --purple-4: oklch(57% 0.11 310);
        --purple-5: oklch(52% 0.11 310);
        
        --bg-anime-back: url(https://i.ibb.co/k6qrrZ4n/anime-fandoms-anime-art-6320551.png);
        --bg-frinds: url(https://i.ibb.co/23DYcfhy/friends.jpg);
        --bg-creepy-mita: url(https://i.ibb.co/zTB5NvLM/Creepy-Mita-miside-games-8891863.jpg);
        --bg-asa-overlay: url(https://i.ibb.co/RVx6HM7/asa-overlay.png);
        --bg-asa-bw: url(https://i.ibb.co/jkkRtrf1/asa-bw.png);
        --bg-asa-blood: url(https://i.ibb.co/DHs8BKsn/asa-blood.png);
        --bg-mikasa: url(https://i.ibb.co/f9wV6tw/mikasa.jpg);
      }
  '';
in {
  home.file."${config.home.homeDirectory}/.config/vesktop/themes/midnight.theme.css" = {
    text = theme;
  };
}