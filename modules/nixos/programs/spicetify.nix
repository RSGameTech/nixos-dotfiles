{
  inputs,
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    programsModule.spicetify = {
      enable = lib.mkEnableOption "Enable Spicetify";
    };
  };

  imports = [
    inputs.spicetify-nix.nixosModules.default
  ];

  config = let
    spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
  in
    lib.mkIf config.programsModule.spicetify.enable {
      programs.spicetify = {
        enable = true;
        enabledExtensions = with spicePkgs.extensions; [
          adblock
          hidePodcasts
          shuffle # shuffle+ (special characters are sanitized out of extension names)
        ];
        enabledCustomApps = with spicePkgs.apps; [
          newReleases
          ncsVisualizer
        ];
        enabledSnippets = with spicePkgs.snippets; [
          rotatingCoverart
          pointer
        ];

        theme = spicePkgs.themes.catppuccin;
        colorScheme = "mocha";

        wayland = true;
      };
    };
}