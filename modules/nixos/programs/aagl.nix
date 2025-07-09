{
  inputs,
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    programsModule.aagl = {
      enable = lib.mkEnableOption "Enable AAGL (An Anime game launcher)";
    };
  };

  imports = [
    inputs.aagl.nixosModules.default
  ];

  config = lib.mkIf config.programsModule.aagl.enable {
    nix.settings = inputs.aagl.nixConfig;
    programs = {
      anime-game-launcher.enable = true;
    };
  };
}