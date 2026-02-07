{...}: {
  imports = [
    ./boot.nix
    ./common.nix
    ./audio.nix
    ./network.nix
    ./bluetooth.nix # Option added
    ./fonts.nix
  ];
}