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
      };
      extensions = with pkgs.vscode-extensions; [
        bbenoist.nix                         # Nix language support
        vscode-icons-team.vscode-icons       # VS Code Icons
        # hedin.headwind                       # Headwind (Tailwind class sorting)
        # cardinal90.multi-cursor-case-preserve # Multiple cursor case preserve
        bradlc.vscode-tailwindcss            # Tailwind CSS IntelliSense
        formulahendry.auto-rename-tag        # Auto Rename Tag
        ms-azuretools.vscode-docker          # Docker extension
      ];
    };
  };
}