{...}: {
  imports = [
    ./desk-env
    ./display-manager
    ./terminal
    # ./sddm.nix
    ./age.nix
    ./obs-studio.nix
    ./spicetify.nix
    ./games.nix
    ./aagl.nix
    ./nvf.nix
  ];

  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}