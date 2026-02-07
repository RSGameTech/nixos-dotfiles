{
  pkgs,
  lib,
  config,
  ...
}: let
  inherit (lib) mkEnableOption;
  cfg = config.modules.services.printing;
in {
  options.modules.services.printing = {
    enable = mkEnableOption "Enable printing";
  };

  config = lib.mkIf cfg.enable {
    services.printing.enable = true;
  };
}