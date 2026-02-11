{
  pkgs,
  lib,
  config,
  ...
}: let
  inherit (lib) mkEnableOption;
  cfg = config.modules.server.microbin;
in {
  options.modules.server.microbin = {
    enable = mkEnableOption "Enable microbin";

    # exampleOption = lib.mkOption {
    #   type = lib.types.str;
    #   default = "example";
    #   description = "An example option";
    # };
  };

  config = lib.mkIf cfg.enable {
    services.microbin = {
      enable = true;
      settings = {
        MICROBIN_PORT = 8801;
        MICROBIN_BIND = "127.0.0.1";
      };
    };
  };
}