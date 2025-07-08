let
  quickCss = ''
    .vc-ranb-button .contents__201d5 {
     display: none; /* hides the "Read All" text */
    }

    .vc-ranb-button::before {
      content: "Read";
      background: var(--bg-1);
      padding: 2px 4px;
      border-radius: 3px;
      font-size: 16px;
      display: inline-block;
    }
  '';
in {
  programs.nixcord = {
    enable = true;
    quickCss = quickCss;
    config = {
      useQuickCss = true;
      frameless = true;
      enableReactDevtools = true;
      disableMinSize = true;
      enabledThemes = [ "midnight.theme.css" ];

      plugins = {
        fakeNitro.enable = true;
        callTimer.enable = true;
        experiments.enable = true;
        gameActivityToggle.enable = true;
        messageClickActions.enable = true;
        messageLogger.enable = true;
        quickReply.enable = true;
        readAllNotificationsButton.enable = true;
        silentTyping.enable = true;
        memberCount.enable = true;
      };
    };
  };
}