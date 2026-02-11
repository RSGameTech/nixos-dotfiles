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
        # Branding
        branding = {
          hide-footer = true;
          # logo-url = "/assets/logo.png"
          # app-name = "My Dashboard";
          # favicon-url = "/assets/logo.png";
          # app-icon-url = "/assets/logo.png";
        };
        # Pages
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
                    type = "videos";
                    channels = [
                      "UCAbAsEZ-0LccTNbl8r-3EaQ"
                      "UCovagaiL6pBYWfvThaXVniA"
                    ];
                    limit = 20;
                  }
                ];
              }
              {
                size = "small";
                widgets = [
                  {
                    type = "clock";
                    title-url = "https://www.timeanddate.com/worldclock/india/kochi";
                    hour-format = "12h";
                    timezones = [
                      {
                        timezone = "Asia/Kolkata";
                        label = "Kolkata, India";
                      }
                      {
                        timezone = "Asia/Tokyo";
                        label = "Tokyo, Japan";
                      }
                    ];
                  }
                  {
                    type = "weather";
                    location = "Ernakulam, India";
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
