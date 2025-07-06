{
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./secureboot.nix
  ];
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      timeout = 2;
    };
    supportedFilesystems = ["ntfs"];
  };
}