{...}: {
  imports = [
    # ./desk-env
    ./display-manager
    ./spicetify.nix
    ./games.nix
    ./aagl.nix
    ./nvf.nix
  ];

  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}