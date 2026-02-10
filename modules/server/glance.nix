{
  pkgs,
  lib,
  config,
  ...
}: let
  inherit (lib) mkEnableOption;
  cfg = config.modules.server.glance;
in {
  options.modules.server.glance = {
    enable = mkEnableOption "Enable glance";

    # port = lib.mkOption {
    #   type = lib.types.port;
    #   default = 8800;
    #   description = "Port for the Glance to host";
    # };
  };

  config = lib.mkIf cfg.enable {
    services.glance = {
      # https://github.com/glanceapp/glance/blob/main/docs/configuration.md
      enable = true;
      settings = {
        server.port = 8800;
        server.host = "127.0.0.1";
        pages = [
          {
            name = "Home";
            columns = [
              {
                size = "small";
                widgets = [
                  {
                    type = "calendar";
                  }
                ];
              }
              {
                size = "full";
                widgets = [
                  {
                    title = "Hacker News";
                    type = "hacker-news";
                  }
                ];
              }
              {
                size = "small";
                widgets = [
                  {
                    type = "weather";
                    location = "Kochi, India";
                  }
                ];
              }
            ];
          }
        ];
      };
      openFirewall = true;
    };
  };
}
