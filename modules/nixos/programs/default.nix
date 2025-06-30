{...}: {
  imports = [
    ./hyprland
    ./terminal
    ./sddm.nix
    ./age.nix
    ./obs-studio.nix
  ];

  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}