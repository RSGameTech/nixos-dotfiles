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
          shuffle
          fullAppDisplayMod
          volumePercentage
        ];
        enabledCustomApps = with spicePkgs.apps; [
          newReleases
          ncsVisualizer
        ];
        enabledSnippets = with spicePkgs.snippets; [
          pointer
          modernScrollbar
        ];

        theme = spicePkgs.themes.text;
        # colorScheme = "mocha";

        wayland = true;

        # nix eval --impure --json --expr 'builtins.attrNames ((builtins.getFlake "github:Gerg-L/spicetify-nix").legacyPackages.x86_64-linux.snippets)'
      };
    };
}