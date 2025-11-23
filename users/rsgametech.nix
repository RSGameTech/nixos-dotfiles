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
    extraGroups = [ "wheel" "networkmanager" "adbusers" "gamemode" "audio" "multimedia" ];
    hashedPasswordFile = config.age.secrets.rsgtPass.path;
    shell = pkgs.zsh;
    packages = with pkgs; [
      tree
      fastfetch
      btop-cuda
      brave
      obsidian
      localsend
      vesktop
      materialgram
      vscode
      bat
      cbonsai
      scrcpy
      anki-bin
      openscad
    ];
  };

  age.secrets.rsgtPass = {
    file = ../secrets/secret1.age;
    owner = username;
  };

  # hjem
  hjem.users.${username} = {
    enable = true;
    user = username;
    directory = config.users.users.${username}.home;
    impure = {
      enable = true;
      dotsDir = "${./config}";
      dotsDirImpure = "/home/${username}/nixos-dotfiles/users/config";
    };
    clobberFiles = lib.mkForce true;
    files = {
      "pictures/wallpapers".source = ../assets/wallpapers;
      ".config/uwsm/env".source = ./config/uwsm/env;
      ".config/wlogout".source = ./config/wlogout;
      ".config/kitty".source = ./config/kitty;
      # ".config/yazi".source = ./config/yazi;
    };
    xdg.config.files = let
      dots = config.hjem.users.${username}.impure.dotsDir;
    in {
      "hypr".source = dots + "/hypr";
      "mango".source = dots + "/mango";
      "quickshell".source = dots + "/quickshell";
      "yazi".source = dots + "/yazi";
    };
  };
}