{...}: {
  imports = [
    ./boot.nix
    ./audio.nix
    ./services.nix
    ./network.nix
    ./bluetooth.nix
    ./fonts.nix
  ];
}