{ pkgs, ... }: {
  services.meilisearch = {
    enable = true; 
    package = pkgs.meilisearch;
    listenAddress = "127.0.0.1";
    listenPort = 7700;
    environment = "development";
    payloadSizeLimit = 131072000; # 125MB
  };
}