{
  pkgs,
  lib,
  config,
  ...
}: let
  inherit (lib) mkEnableOption;
  cfg = config.modules.programs.adb;
in {
  options.modules.programs.adb = {
    enable = mkEnableOption "Enable adb";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      platform-tools
    ];
  };
}