{
  description = "My own NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    hjem = {
      url = "github:feel-co/hjem";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hjem-impure.url = "github:Rexcrazy804/hjem-impure";
    # silentSDDM = {
    #   url = "github:uiriansan/SilentSDDM";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # nvf = {
    #   url = "github:NotAShelf/nvf";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
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
      # euthymia - Main Laptop - Lenovo LOQ 15IAX9
      euthymia = nixpkgs.lib.nixosSystem {
        specialArgs = { 
          inherit inputs outputs;
          users = ["rsgametech"];
        };
        modules = [
          ./hosts/euthymia/configuration.nix
          ./modules
          ./users
          inputs.agenix.nixosModules.default
        ];
      };
      #irminsul - Laptop HomeLab - ASUS X541UV
      irminsul = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs outputs;
          users = ["rsgametech"];
        };
        modules = [
          ./hosts/irminsul/configuration.nix
          ./modules
          ./users
          inputs.agenix.nixosModules.default
        ];
      };
    };

    templates = {
      web-basic = {
        path = ./templates/web-basic;
        description = "A basic web template with a simple HTML structure.";
        welcomeText = "A minimal web-basic template! (by RSGameTech)";
      };
      node-js-dev = {
        path = ./templates/node-js-dev;
        description = "A Node.js project template setup.";
        welcomeText = "A Node.js template(by RSGameTech)";
      };
    };
  };
}