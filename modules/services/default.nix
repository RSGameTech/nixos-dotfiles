{...}: {
  imports = [
    ./keyd.nix
    ./printing.nix
    ./openssh.nix
  ];

  services.libinput = {
    enable = true;
    mouse = {
      accelProfile = "flat";
      accelSpeed = "0";
      middleEmulation = false;
    };
    touchpad = {
      accelProfile = "flat";
      accelSpeed = "0";
      disableWhileTyping = true;
    };
  };

  # services.undervolt = {
  #   enable = true;
  # }
  powerManagement.cpuFreqGovernor = "ondemand";
}