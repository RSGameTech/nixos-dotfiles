{
  pkgs,
  lib,
  config,
  ...
}: let
  inherit (lib) mkEnableOption;
  cfg = config.modules.server.glance;
  configPath = ./config;
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
      enable = true;
      settings = {
        server = {
          port = 8800;
          host = "127.0.0.1";
        };
        branding = import (configPath + /branding.nix);
        # theme = import (configPath + /theme.nix);
        pages = import (configPath + /pages.nix);
      };
      openFirewall = true;
    };
  };
}
