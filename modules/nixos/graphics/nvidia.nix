{
  pkgs,
  config,
  lib,
  ...
}: {
  options = {
    graphicsModule = {
      nvidia = {
        enable = lib.mkEnableOption "Enable NVIDIA graphics card support";
        hybrid = {
          enable = lib.mkEnableOption "Enable NVIDIA optimus prime";
          igpu = {
            vendor = lib.mkOption {
              type = lib.types.enum ["intel" "amd"];
              default = "intel";
            };
            port = lib.mkOption {
              default = "";
              description = "Bus Port for iGpu";
            };
          };
          dgpu.port = lib.mkOption {
            default = "";
            description = "Bus Port for dGpu";
          };
        };
      };
    };
  };

  config = let
    cfg = config.graphicsModule.nvidia;
  in
    lib.mkIf cfg.enable {
      services.xserver.videoDrivers = [ "nvidia" ];
      hardware.nvidia = {
        modesetting.enable = true;
        dynamicBoost.enable = true;
        powerManagement = {
          enable = true;
          finegrained = cfg.hybrid.enable;
        };
        open = true;
        nvidiaSettings = true;
        prime = lib.mkIf cfg.hybrid.enable {
          offload = {
            enable = true;
            enableOffloadCmd = true;
          };
          intelBusId = lib.mkIf (cfg.hybrid.igpu.vendor == "intel") cfg.hybrid.igpu.port;
          amdgpuBusId = lib.mkIf (cfg.hybrid.igpu.vendor == "amd") cfg.hybrid.igpu.port;
          nvidiaBusId = cfg.hybrid.dgpu.port;
        };
        package = config.boot.kernelPackages.nvidiaPackages.stable;
      };
    };
}