{
  pkgs,
  inputs,
  lib,
  config,
  ...
}: let
  inherit (lib) mkEnableOption;
  cfg = config.modules.programs.obs-studio;
in {
  options.modules.programs.obs-studio = {
    enable = mkEnableOption "Enable obs-studio";

    exampleOption = lib.mkOption {
      type = lib.types.str;
      default = "example";
      description = "An example option";
    };
  };

  config = lib.mkIf cfg.enable {
    programs.obs-studio = {
      enable = true;
      enableVirtualCamera = true;
      plugins = with pkgs.obs-studio-plugins; [
        wlrobs
        obs-pipewire-audio-capture
        obs-vkcapture
        obs-source-clone
        obs-move-transition
        obs-composite-blur
        obs-backgroundremoval
      ];
    };
  };
}