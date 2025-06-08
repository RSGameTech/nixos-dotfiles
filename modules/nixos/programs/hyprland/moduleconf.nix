pkgs: {
  programs.hyprland = {
    enable = true;
    withUWSM = true;
    xwayland.enable = true;
  };
  programs.hyprlock.enable = true;

  qt.enable = true;

  environment.systemPackages = [
    pkgs.kdePackages.qt6ct

    pkgs.rose-pine-icon-theme
    pkgs.rose-pine-gtk-theme

    pkgs.swww
    pkgs.hyprpaper
    pkgs.wl-clipboard
    pkgs.cliphist
    pkgs.brightnessctl
    pkgs.playerctl
    pkgs.fuzzel
    pkgs.rofi-wayland
    pkgs.wl-screenrec
    pkgs.wlogout
    pkgs.libnotify
    pkgs.networkmanagerapplet

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
}