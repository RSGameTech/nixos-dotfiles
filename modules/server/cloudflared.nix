{
  pkgs,
  lib,
  config,
  ...
}: let
  inherit (lib) mkEnableOption;
  cfg = config.modules.server.cloudflared;
in {
  options.modules.server.cloudflared = {
    enable = mkEnableOption "Enable Cloudflared";

    # exampleOption = lib.mkOption {
    #   type = lib.types.str;
    #   default = "example";
    #   description = "An example option";
    # };
  };

  config = lib.mkIf cfg.enable {
    services.cloudflared = {
      enable = true;
    };
  };
}