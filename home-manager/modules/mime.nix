{pkgs, ... }: {
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "text/html" = ["firefox.desktop"];
      "application/pdf" = ["libreoffice.desktop"];
      "image/*" = ["qimgv.desktop"];
    };
  };
}
