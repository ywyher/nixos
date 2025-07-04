{ pkgs, ... }: {
  programs.vscode = {
    enable = true;
    profiles.default = {
      userSettings = {
        "chat.commandCenter.enabled" = false;
        "editor.tabSize" = 2;
        "files.autoSave" = "afterDelay";
        "javascript.preferences.importModuleSpecifier" = "non-relative";
        "typescript.preferences.importModuleSpecifier" = "non-relative";
        "workbench.iconTheme" = "vscode-icons";
        "workbench.layoutControl.enabled" = false;
        "workbench.navigationControl.enabled" = false;
        "workbench.statusBar.visible" = false;
        "window.menuBarVisibility" = "compact";
        "search.exclude" = {
          "**/node_modules" = true;
          "**/bower_components" = true;
          "**/*.code-search" = true;
          "**/dist" = true;
          "**/.next" = true;
          "**/out" = true;
          "**/build" = true;
        };
        "files.exclude" = {
          "**/node_modules" = true;
          "**/.git" = true;
          "**/.DS_Store" = true;
          "**/.next" = false;
          "**/dist" = false;
        };
        "typescript.updateImportsOnFileMove.enabled" = "always";
        "editor.largeFileOptimizations" = false;
      };
      extensions = with pkgs.vscode-extensions; [
        bbenoist.nix                         # Nix language support
        vscode-icons-team.vscode-icons       # VS Code Icons
        bradlc.vscode-tailwindcss            # Tailwind CSS IntelliSense
        formulahendry.auto-rename-tag        # Auto Rename Tag
        ms-azuretools.vscode-docker          # Docker extension
      ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
        {
          name = "multi-cursor-case-preserve";
          publisher = "cardinal90";
          version = "1.0.5";
          sha256 = "sha256-eJafjYDydD8DW83VLH9MPFeDENXBx3el7XvjZqu88Jw=";
        }
      ];
    };
  };
}