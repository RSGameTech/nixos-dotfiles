{
  description = "Basic Web Development Environment";

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
        ];
        shellHook = "echo Web Dev Environment Ready!";
      };
    });
  };
}