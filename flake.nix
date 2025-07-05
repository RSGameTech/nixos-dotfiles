{
  description = "My own NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    hjem = {
      url = "github:feel-co/hjem";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    lanzaboote = {
      url = "github:nix-community/lanzaboote/v0.4.2";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
      # inputs.agenix.inputs.darwin.follows = "";
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
      euthymia = nixpkgs.lib.nixosSystem {
        specialArgs = { 
          inherit inputs outputs;
          users = ["rsgametech"];  ## Need to check Rexi's user configuration for understanding :)
        };
        modules = [
          ./hosts/euthymia/configuration.nix
          ./modules
          ./users
          inputs.agenix.nixosModules.default
          inputs.lanzaboote.nixosModules.lanzaboote
          ({ pkgs, lib, ... }: {

            environment.systemPackages = [
              # For debugging and troubleshooting Secure Boot.
              pkgs.sbctl
            ];

            # Lanzaboote currently replaces the systemd-boot module.
            # This setting is usually set to true in configuration.nix
            # generated at installation time. So we force it to false
            # for now.
            boot.loader.systemd-boot.enable = lib.mkForce false;

            boot.lanzaboote = {
              enable = true;
              pkiBundle = "/var/lib/sbctl";
            };
          })
        ];
      };
      
      # asus-x541uv = planning to add this later after I fix the issues with the hardware.
    };

    templates = {
      web-basic = {
        path = ./templates/web-basic;
        description = "A basic web template with a simple HTML structure.";
        welcomeText = "A minimal web-basic template! (by RSGameTech)";
      };
    };
  };
}