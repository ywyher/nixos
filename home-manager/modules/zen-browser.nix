{ pkgs, ... }: {
  programs.zen-browser = {
    enable = true;
    nativeMessagingHosts = [pkgs.firefoxpwa];
    policies = {
      NoDefaultBookmarks = true;
      DisableFirefoxAccounts = true;
      DisableAccounts = true;
      AutofillAddressEnabled = true;
      AutofillCreditCardEnabled = false;
      DisableAppUpdate = true;
      DisableFeedbackCommands = true;
      DisableFirefoxStudies = true;
      DisablePocket = true;
      DontCheckDefaultBrowser = true;
      DisableTelemetry = true;
      EnableTrackingProtection = {
        Value= true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };
      ExtensionSettings = {
        # ublock origin
        "uBlock0@raymondhill.net" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          installation_mode = "force_installed";
        };
        # wappalyzer
        "wappalyzer@crunchlabz.com" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/wappalyzer/latest.xpi";
          installation_mode = "force_installed";
        };
        # Unhook
        "myallychou@gmail.com" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/youtube-recommended-videos/latest.xpi";
          installation_mode = "force_installed";
        };
        # Video speed controller
        "{7be2ba16-0f1e-4d93-9ebc-5164397477a9}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/videospeed/latest.xpi";
          installation_mode = "force_installed";
        };
      };
      Preferences = {
        "zen.view.experimental-no-window-controls" = true;
        "zen.glance.enabled" = false;
        "zen.view.compact.show-sidebar-and-toolbar-on-hover" = false;
      };
    };
  };
}