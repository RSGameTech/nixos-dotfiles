{
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };
    pulse.enable = true;
    jack.enable = true;
    wireplumber = {
      enable = true;
      # extraConfig = {
      #   "99-default-sink" = {
      #     "wireplumber.default-nodes" = {
      #       "audio.sink.default" = "alsa_output.pci-0000_00_1f.3.pro-output-0";
      #     };
      #   };
      # };
    };
  };
}