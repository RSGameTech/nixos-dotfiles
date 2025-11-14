{
  pkgs,
  inputs,
  lib,
  config,
  ...
}: {
  options = {
    programsModule.deskEnv.mangowm = {
      enable = lib.mkEnableOption "Enable Mango Window Manager";
    };
  };

  imports = [
    inputs.mango.nixosModules.mango
  ];

  config = lib.mkIf config.programsModule.deskEnv.mangowm.enable {
    programs.mango.enable = true;
  };
}