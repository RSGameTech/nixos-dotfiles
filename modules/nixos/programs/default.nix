{...}: {
  imports = [
    ./hyprland
    ./terminal
    ./sddm.nix
    ./age.nix
    ./obs-studio.nix
    ./spicetify.nix
    ./games.nix
    ./aagl.nix
  ];

  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}