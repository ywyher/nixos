{ pkgs, lib, user, ... }: {
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
        # Allow right click
        "{278b0ae0-da9d-4cc6-be81-5aa7f3202672}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/re-enable-right-click/latest.xpi";
          installation_mode = "force_installed";
        };
        # Yomitan
        "{6b733b82-9261-47ee-a595-2dda294a4d08}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/yomitan/latest.xpi";
          installation_mode = "force_installed";
        };
        # Refined github
        "{a4c4eda4-fb84-4a84-b4a1-f7c1cbf2a1ad}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/refined-github-/latest.xpi";
          installation_mode = "force_installed";
        };
      };
    };
  };

  home.activation.zenUserJs = lib.hm.dag.entryAfter ["writeBoundary"] ''
    if [ -f "/home/${user}/.zen/profiles.ini" ]; then
      path=$(grep "Path=" "/home/${user}/.zen/profiles.ini" | head -1 | cut -d= -f2)
      if [ -n "$path" ]; then
        mkdir -p "$HOME/.zen/$path"
        cat > "$HOME/.zen/$path/user.js" << 'EOF'
user_pref("zen.view.experimental-no-window-controls", true);
user_pref("zen.glance.enabled", false);
user_pref("zen.view.compact.show-sidebar-and-toolbar-on-hover", false);
EOF
      fi
    fi
  '';
}