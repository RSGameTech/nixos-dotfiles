{...}: {
  imports = [
    ./keyd.nix # Option Added with sub option
    ./ly.nix # Option Added without sub option
    ./printing.nix # Option Added without sub option
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
