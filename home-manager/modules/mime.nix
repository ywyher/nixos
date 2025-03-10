{pkgs, ... }: {
  xdg = {
    mimeApps = {
      enable = true;
      defaultApplications = {
        "inode/directory" = ["nautilus.desktop"]; # Directories
        "text/plain" = ["code.desktop"]; # Plain text
        "text/*" = ["code.desktop"]; # Any text files

        "application/vnd.openxmlformats-officedocument.wordprocessingml.document" = ["libreoffice.desktop"]; # .docx
        "application/vnd.openxmlformats-officedocument.presentationml.presentation" = ["libreoffice.desktop"]; # .pptx
        "application/pdf" = ["libreoffice.desktop"]; # .pdf

        "x-scheme-handler/https" = ["zen.desktop"]; # Links
        "x-scheme-handler/http" = ["zen.desktop"]; # Links
        "x-scheme-handler/mailto" = ["thunderbird.desktop"]; # Links

        "video/*" = ["mpv.desktop"]; # Any video files
        "image/*" = ["qimgv.desktop"]; # Images
        "image/png" = ["qimgv.desktop"];
        "image/jpeg" = ["qimgv.desktop"];
      };
    };
  };
}
