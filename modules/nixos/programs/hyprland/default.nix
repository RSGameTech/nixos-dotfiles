{
  pkgs,
  inputs,
  lib,
  config,
  ...
}: {
  options = {
    programsModule.hyprland = {
      enable = lib.mkEnableOption "Enable Hyprland WM";
    };
  };
  config = let
    cfg = config.programsModule.hyprland;
  in
    lib.mkIf cfg.enable (lib.mkMerge [
      (import ./moduleconf.nix pkgs)
      {
        environment.systemPackages = [
          (inputs.quickshell.packages.${pkgs.system}.default.override {
            withHyprland = true;
            withWayland = true;
            withPipewire = true;
            withQtSvg = true;
            withX11 = false;
            withI3 = false;
          })
        ];
      }
    ]);
}