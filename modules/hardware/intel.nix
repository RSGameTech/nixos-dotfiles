{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    graphicsModule = {
      intel.enable = lib.mkEnableOption "Enable intel graphics card";
    };
  };

  config = lib.mkIf config.graphicsModule.intel.enable {
    hardware.graphics.extraPackages = with pkgs; [
      intel-media-driver
      vpl-gpu-rt
      intel-vaapi-driver
      libvdpau-va-gl
      intel-ocl
    ];
    # environment.sessionVariables = {LIBVA_DRIVER_NAME = "iHD";}; # Force intel-media-driver
    # environment.sessionVariables = {LIBVA_DRIVER_NAME = "i965";}; # Force intel-vaapi-driver
  };
}