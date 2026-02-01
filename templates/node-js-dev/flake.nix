{
  description = "Node.js Development Environment";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = {
    self,
    nixpkgs,
    ...
  }: let
    systems = ["x86_64-linux" "aarch64-linux"];
    forAllSystems = fn: nixpkgs.lib.genAttrs systems (
      system: fn (import nixpkgs { inherit system; })
    );
  in {
    devShells = forAllSystems (pkgs: {
      default = pkgs.mkShell {
        buildInputs = [
          pkgs.live-server
          pkgs.nodejs
          pkgs.yarn
          pkgs.pnpm
          pkgs.nodePackages.vercel
        ];
        shellHook = ''
          echo "Node.js Dev Environment Ready!"
        '';
      };
    });
  }
}