{...}: {
  imports = [
    ./bluetooth.nix
  ];

  networking.networkmanager.wifi.powersave = false;
}