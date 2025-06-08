{...}: {
  services.thermald.enable = true;
  services.fwupd.enable = true;

  services.printing.enable = false;

  hardware.enableAllHardware = true;
  hardware.enableAllFirmware = true;
  hardware.steam-hardware.enable = true;

  services.libinput.enable = true;
}