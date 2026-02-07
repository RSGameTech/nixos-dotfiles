{
  pkgs,
  lib,
  config,
  ...
}: let
  inherit (lib) mkEnableOption;
  cfg = config.modules.services.keyd;
in {
  options.modules.services.keyd = {
    enable = mkEnableOption "Enable keyd";
    deviceID = lib.mkOption {
      type = lib.types.str;
      default = "0001:0001";
      description = "An example device ID for keyd configuration";
    };
  };

  config = lib.mkIf cfg.enable {
    services.keyd = {
      enable = true;
      keyboards = {
        default = {
          ids = [ cfg.deviceID ];
          settings = {
            main = {
              esc = "capslock";
              capslock = "esc";
            };
          };
        };
      };
    };
  };
}