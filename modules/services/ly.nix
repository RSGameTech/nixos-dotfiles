{
  pkgs,
  lib,
  config,
  ...
}: let
  inherit (lib) mkEnableOption;
  cfg = config.modules.services.ly;
in {
  options.modules.services.ly = {
    enable = mkEnableOption "Enable ly";
  };

  config = lib.mkIf cfg.enable {
    services.displayManager.ly = {
      enable = true;
      settings = {
        animation = null;
        allow_empty_password = false;
        clear_password = true;
        auth_fails = 5;
      };
    };
  };
}
