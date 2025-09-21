{
  pkgs,
  inputs,
  lib,
  config,
  ...
}: {
  options = {
    programsModule.displayManager.greetd = {
      enable = lib.mkEnableOption "Enable greetd display manager";
    };
  };

  # inputs.zaphkiel.nixosModules.kurukuruDM

  config = lib.mkIf config.programsModule.displayManager.greetd.enable {
    services.greetd = {
      enable = true;
      package = pkgs.greetd;
      settings = {
        command = "${pkgs.tuigreet}/bin/tuigreet --cmd hyprland ";
      };
      useTextGreeter = true;
    };
  };
}