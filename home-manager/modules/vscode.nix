{ pkgs, ... }: {
  programs.vscode = {
    enable = true;
    profiles.default = {
      userSettings = {
        "editor.tabSize" = 2;
        "files.autoSave" = "afterDelay";
        "javascript.preferences.importModuleSpecifier" = "non-relative";
        "typescript.preferences.importModuleSpecifier" = "non-relative";
        "workbench.iconTheme" = "vscode-icons";
        "workbench.statusBar.visible" = false;
        "chat.commandCenter.enabled" = false;
        "workbench.layoutControl.enabled" = false;
        "workbench.navigationControl.enabled" = false;
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