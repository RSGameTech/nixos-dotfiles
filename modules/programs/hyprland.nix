{
  pkgs,
  inputs,
  lib,
  config,
  ...
}: let
  inherit (lib) mkEnableOption;
  cfg = config.modules.programs.hyprland;
in {
  options.modules.programs.hyprland = {
    enable = mkEnableOption "Enable Hyprland";
  };

  config = lib.mkIf cfg.enable {
    programs.hyprland = {
      enable = true;
      withUWSM = true;
      xwayland.enable = true;
    };
    programs.hyprlock.enable = true;
    qt.enable = true;
    environment.variables = {
      pkgs.quickshell
      pkgs.kdePackages.qtsvg
      pkgs.kdePackages.qtimageformats
      pkgs.kdePackages.qtmultimedia
      pkgs.kdePackages.qt5compat
      pkgs.libnotify
      pkgs.wl-screenrec
      pkgs.wl-clipboard
      pkgs.cliphist
      pkgs.swww
      pkgs.brightnessctl
      pkgs.playerctl
      pkgs.fuzzel
      pkgs.wayfreeze
      pkgs.grim
      pkgs.slurp
      pkgs.swappy
      pkgs.mpv
      pkgs.imv
    };
    modules.programs = {
      foot.enable = true;
    };
    xdg.portal = {
      enable = true;
      extraPortals = [
        pkgs.xdg-desktop-portal-gtk
      ];
    };
    services = {
      power-profiles-daemon.enable = true;
      upower = {
        enable = true;
        usePercentageForPolicy = true;
      };
    };
    security.soteria.enable = true;
  };
}

# {
#   config = let
#     cfg = config.programsModule.deskEnv.hyprland;
#   in
#     lib.mkIf cfg.enable (lib.mkMerge [
#       (let
#         kokomiCursor = pkgs.callPackage ../../pkgs/kokomiCursor.nix {};
#         ayakaCursor = pkgs.callPackage ../../pkgs/ayakaCursor.nix {};
#       in {
#         environment.systemPackages = [
#           kokomiCursor
#           ayakaCursor

#           pkgs.kdePackages.qt6ct
#           pkgs.kdePackages.breeze

#           pkgs.rose-pine-icon-theme
#           pkgs.rose-pine-gtk-theme

#           pkgs.networkmanagerapplet

#           pkgs.yazi
#           pkgs.ripdrag


#           pkgs.libsForQt5.qt5.qtgraphicaleffects
#         ];
#       })
#     ]);
# }