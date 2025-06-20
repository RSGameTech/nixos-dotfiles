{
  description = "My own NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    hjem = {
      url = "github:feel-co/hjem";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    quickshell = {
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # spicetify-nix.url = "github:Gerg-L/spicetify-nix";  ## Setup not completed yet, but planning to do it later :)
  };

  outputs = {
    self,
    nixpkgs,
    ...
  } @inputs: let
    inherit (self) outputs;
    systems = ["x86_64-linux" "aarch64-linux"];
    forAllSystems = fn: nixpkgs.lib.genAttrs systems (
      system: fn (import nixpkgs { inherit system; })
    );
  in {
    formatter = forAllSystems (pkgs: pkgs.alejandra);

    packages = forAllSystems (pkgs: {
      defaults = pkgs.hello;
    });

    nixosConfigurations = {
      loq15iax9 = nixpkgs.lib.nixosSystem {
        specialArgs = { 
          inherit inputs outputs;
          users = ["rsgametech"];  ## Need to check Rexi's user configuration for understanding :)
        };
        modules = [
          ./hosts/loq15iax9/configuration.nix
          ./modules
          ./users
        ];
      };
      
      # asus-x541uv = planning to add this later after I fix the issues with the hardware.
    };
  };
}