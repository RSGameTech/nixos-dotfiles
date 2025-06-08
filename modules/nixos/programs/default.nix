{...}: {
  imports = [
    ./hyprland
  ];

  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}