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
    environment.systemPackages = [
      pkgs.swww
      pkgs.wl-clipboard
      pkgs.brightnessctl
      pkgs.playerctl
      pkgs.fuzzel
      pkgs.rofi
      pkgs.wlogout
      pkgs.wl-screenrec
      pkgs.libnotify
      pkgs.grim
      pkgs.slurp
      pkgs.swappy
      pkgs.networkmanagerapplet
      pkgs.mpv
      pkgs.imv

      pkgs.yazi
      pkgs.ripdrag

      pkgs.kdePackages.qtsvg
      pkgs.kdePackages.qt5compat
      pkgs.kdePackages.qtimageformats
      pkgs.libsForQt5.qt5.qtgraphicaleffects

      (inputs.quickshell.packages.${pkgs.system}.default.override {
        withHyprland = true;
        withWayland = true;
        withPipewire = true;
        withQtSvg = true;
        withX11 = false;
        withI3 = false;
      })
    ];
  };
}