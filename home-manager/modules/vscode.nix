{ pkgs, ... }: {
  programs.vscode = {
    enable = true;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      bbenoist.nix                         # Nix language support
      vscode-icons-team.vscode-icons       # VS Code Icons
      # hedin.headwind                       # Headwind (Tailwind class sorting)
      # cardinal90.multi-cursor-case-preserve # Multiple cursor case preserve
      bradlc.vscode-tailwindcss            # Tailwind CSS IntelliSense
      formulahendry.auto-rename-tag        # Auto Rename Tag
      ms-azuretools.vscode-docker          # Docker extension
    ];
  };
}