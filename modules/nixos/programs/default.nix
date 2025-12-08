{...}: {
  imports = [
    ./desk-env
    ./display-manager
    ./terminal
    # ./age.nix
    ./spicetify.nix
    ./games.nix
    ./aagl.nix
    ./nvf.nix
  ];

  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}