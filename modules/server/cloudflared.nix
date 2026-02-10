{
  pkgs,
  lib,
  config,
  ...
}: let
  inherit (lib) mkEnableOption;
  cfg = config.modules.server.cloudflared;
in {
  options.modules.server.cloudflared = {
    enable = mkEnableOption "Enable Cloudflared";
  };

  config = lib.mkIf cfg.enable {
    age.secrets.cloudflaredTunnel = {
      file = ../../secrets/cloudflared-tunnel.age;
      mode = "600";
    }; 
    services.cloudflared = {
      enable = true;
      tunnels = {
        "2ea3b9c4-7e25-4a7b-84a0-01a894faffa8" = {
          credentialsFile = config.age.secrets.cloudflaredTunnel.path;
          ingress = {
            "glance.rsgametech.com" = {
              service = "http://localhost:8800";
            };
          };
          default = "http_status:404";
        };
      };
    };
      
  };
}
