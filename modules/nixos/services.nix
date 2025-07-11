{...}: {
  services.thermald.enable = true;
  services.fwupd.enable = true;
  services.power-profiles-daemon.enable = true;

  services.printing.enable = false;

  hardware.enableAllHardware = true;
  hardware.enableAllFirmware = true;
  hardware.steam-hardware.enable = true;

  services.libinput = {
    enable = true;
    mouse.accelProfile = "flat";
    touchpad = {
      accelProfile = "flat";
      disableWhileTyping = true;
    };
  };

  # services.undervolt = {
  #   enable = true;
  # }
  powerManagement.cpuFreqGovernor = "ondemand";
}