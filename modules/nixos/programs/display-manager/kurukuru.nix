{
  pkgs,
  inputs,
  lib,
  config,
  ...
}: {
  options = {
    programsModule.displayManager.kurukuru = {
      enable = lib.mkEnableOption "Enable kurukuru display manager";
    };
  };

  imports = [inputs.zaphkiel.nixosModules.kurukuruDM];

  config = lib.mkIf config.programsModule.displayManager.kurukuru.enable {

    programs.kurukuruDM = {
      enable = true;
      package = pkgs.kurukurubar;
      settings = {
        wallpaper = ~/pictures/wallpapers/ayaka-paint.png;
        instantAuth = false;
        default_user = "rsgametech";
        default_session = "hyprland-uwsm";
      };
    };
  };
}