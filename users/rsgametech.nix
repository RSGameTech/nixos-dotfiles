{
  pkgs,
  config,
  inputs,
  lib,
  ...
}: let
  username = "rsgametech";
  description = "RSGameTech";
in {
  users.users.${username} = {
    inherit description;
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "adbusers" ];
    packages = with pkgs; [
      tree
      fastfetch
      btop
      brave
      vesktop
      vscode
    ];
  };

  # hjem
  hjem.users.${username} = {
    enable = true;
    user = username;
    directory = config.users.users.${username}.home;
    clobberFiles = lib.mkForce true;
    files = {
      ".config/hypr".source = ./config/hypr;
    };
  };
}