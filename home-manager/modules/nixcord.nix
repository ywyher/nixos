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
        hideAttachments.enable = true;
        fakeNitro.enable = true;
        anonymiseFileNames.enable = true;
        betterRoleDot = {
          enable = true;
          bothStyles = true;
        };
        callTimer.enable = true;
        decor.enable = true;
        disableCallIdle.enable = true;
        experiments.enable = true;
        friendsSince.enable = true;
        gameActivityToggle.enable = true;
        messageClickActions.enable = true;
        messageLogger.enable = true;
        petpet.enable = true;
        quickReply.enable = true;
        readAllNotificationsButton.enable = true;
        sendTimestamps.enable = true;
        serverInfo.enable = true;
        silentTyping.enable = true;
        translate.enable = true;
        typingIndicator.enable = true;
        whoReacted.enable = true;
        memberCount.enable = true;
        pinDMs.enable = true;
        fixCodeblockGap.enable = true;
        fixImagesQuality.enable = true;
        platformIndicators.enable = true;
      };
    };
  };
}