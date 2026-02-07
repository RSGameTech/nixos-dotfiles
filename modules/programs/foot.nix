{
  pkgs,
  lib,
  config,
  ...
}: let
  inherit (lib) mkEnableOption;
  cfg = config.modules.programs.foot;
in {
  options.modules.programs.foot = {
    enable = mkEnableOption "Enable foot";
    # exampleOption = lib.mkOption {
    #   type = lib.types.str;
    #   default = "example";
    #   description = "An example option";
    # };
  };

  config = lib.mkIf cfg.enable {
    programs.foot = {
      enable = true;
      settings = {
        main = {
          gamma-correct-blending = false;
          # dpi-aware = true;
          font = "JetBrainsMono Nerd Font:size=10";
        };
        cursor = {
          blink = true;
        };
        mouse = {
          hide-when-typing = true;
        };
      };
    };
  };
}