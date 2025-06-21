{...}: {
  imports = [
    ./hyprland
    ./terminal
    ./sddm.nix
  ];

  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}