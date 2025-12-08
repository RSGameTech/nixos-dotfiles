{
  services.pulseaudio.enable = false;
  services.udev.enable = true;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    # alsa = {
    #   enable = true;
    #   support32Bit = true;
    # };
    pulse.enable = true;
    # jack.enable = true;
    wireplumber = {
      enable = true;
      extraConfig = {
        "50-alsa-policy" = {
          "default.policy.auto-switch" = true;
        };
      };
    };
  };
}