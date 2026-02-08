{
  pkgs,
  inputs,
  lib,
  config,
  ...
}: let
  inherit (lib) mkEnableOption;
  cfg = config.modules.server.glance;
in {
  options.modules.server.glance = {
    enable = mkEnableOption "Enable glance";

    # exampleOption = lib.mkOption {
    #   type = lib.types.str;
    #   default = "example";
    #   description = "An example option";
    # };
  };

  config = lib.mkIf cfg.enable {
    services.glance = {
      enable = true;
      settings = {
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