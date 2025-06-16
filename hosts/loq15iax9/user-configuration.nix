{config, lib, pkgs, ...}: {
  imports = [
    ./../../users/programs
  ];

  # users.users.rsgametech = {
  #   isNormalUser = true;
  #   extraGroups = [ "wheel" "networkmanager" "adbusers" ];
  #   shell = pkgs.zsh;
  #   packages = with pkgs; [
  #     tree
  #     fastfetch
  #     btop
  #     brave
  #     vesktop
  #     vscode
  #   ];
  # };
}