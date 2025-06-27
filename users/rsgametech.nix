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
    extraGroups = [ "wheel" "networkmanager" "adbusers" "audio" "multimedia" ];
    shell = pkgs.zsh;
    packages = with pkgs; [
      tree
      fastfetch
      btop
      brave
      localsend
      vesktop
      vscode
      bat
    ];
  };

  # hjem
  hjem.users.${username} = {
    enable = true;
    user = username;
    directory = config.users.users.${username}.home;
    clobberFiles = lib.mkForce true;
    files = {
      "pictures/wallpapers".source = ../assets/wallpapers;
      ".config/uwsm/env".source = ./config/uwsm/env;
      ".config/hypr".source = ./config/hypr;
      ".config/waybar".source = ./config/waybar;
      ".config/quickshell".source = ./config/quickshell;
      ".config/wlogout".source = ./config/wlogout;
      ".config/kitty".source = ./config/kitty;
      ".config/yazi".source = ./config/yazi;
    };
  };
}