{...}: {
  imports = [
    ./printing.nix
  ];

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