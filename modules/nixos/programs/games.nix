{
  pkgs,
  ...
}: {
  # imports = [
  #   ./aagl.nix
  # ];

  programs = {
    gamemode = {
      enable = true;
      settings = {
        custom = {
          start = "${pkgs.libnotify}/bin/notify-send 'GameMode started'";
          end = "${pkgs.libnotify}/bin/notify-send 'GameMode ended'";
        };
      };
    };
    gamescope = {
      enable = true;
    };
    steam = {
      enable = true;
      gamescopeSession.enable = true;
    };
  };

  environment.systemPackages = with pkgs; [
    mangohud
    protonup-ng
  ];

  # environment.sessionVariables = {
  #   STEAM_EXTRA_COMPACT_TOOLS_PATHS = "/home/user/.steam/root/compatibilitytools.d";
  # };
}