{
  inputs,
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    bootModule.lanzaboote = {
      enable = lib.mkEnableOption "Enable lanzaboote for secure boot";
    };
  };

  imports = [
    inputs.lanzaboote.nixosModules.lanzaboote
  ];

  config = lib.mkIf config.bootModule.lanzaboote.enable {
    environment.systemPackages = [
      pkgs.sbctl
    ];
    boot = {
      loader.systemd-boot.enable = lib.mkForce false;
      lanzaboote = {
        enable = true;
        pkiBundle = "/var/lib/sbctl";
      };
    };
  };
}