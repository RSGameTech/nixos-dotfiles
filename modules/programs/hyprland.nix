{
  pkgs,
  inputs,
  lib,
  config,
  ...
}: {
  options = {
    programsModule.deskEnv.hyprland = {
      enable = lib.mkEnableOption "Enable Hyprland window manager";
    };
  };
  config = let
    cfg = config.programsModule.deskEnv.hyprland;
  in
    lib.mkIf cfg.enable (lib.mkMerge [
      (let
        kokomiCursor = pkgs.callPackage ../../pkgs/kokomiCursor.nix {};
        ayakaCursor = pkgs.callPackage ../../pkgs/ayakaCursor.nix {};
      in {
        programs.hyprland = {
          enable = true;
          withUWSM = true;
          xwayland.enable = true;
        };
        programs.hyprlock.enable = true;
        qt.enable = true;
        environment.systemPackages = [
          kokomiCursor
          ayakaCursor

          pkgs.kdePackages.qt6ct
          pkgs.kdePackages.breeze

          pkgs.rose-pine-icon-theme
          pkgs.rose-pine-gtk-theme

          pkgs.swww
          pkgs.wl-clipboard
          pkgs.cliphist
          pkgs.brightnessctl
          pkgs.playerctl
          pkgs.fuzzel
          pkgs.rofi
          pkgs.wlogout
          pkgs.wl-screenrec
          pkgs.wayfreeze
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
          (inputs.zaphkiel.packages.${pkgs.system}.kurukurubar.override {
            rembg = pkgs.hello;
          })
        ];

        xdg.portal = {
          enable = true;
          extraPortals = [
            pkgs.xdg-desktop-portal-gtk
          ];
        };

        services.power-profiles-daemon.enable = true;
        services.upower = {
          enable = true;
          usePercentageForPolicy = true;
          # criticalPowerAction = "PowerOff";
        };
        # services.displayManager.sddm = {
        #   package = pkgs.kdePackages.sddm;
        #   extraPackages = [
        #     pkgs.kdePackages.qtmultimedia
        #     pkgs.kdePackages.qtsvg
        #     pkgs.kdePackages.qt5compat
        #     pkgs.kdePackages.qtimageformats
        #   ];
        # };
        security.soteria.enable = true;
      })
    ]);
}