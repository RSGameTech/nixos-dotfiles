{
  pkgs,
  lib,
  config,
  ...
}: {
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
}