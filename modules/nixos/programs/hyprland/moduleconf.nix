pkgs: let
  kokomiCursor = pkgs.callPackage ../../../../pkgs/kokomiCursor.nix{};
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
    pkgs.rofi-wayland
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
  services.displayManager.sddm = {
    package = pkgs.kdePackages.sddm;
    extraPackages = [
      pkgs.kdePackages.qtmultimedia
    ];
  };

  security.soteria.enable = true;
}