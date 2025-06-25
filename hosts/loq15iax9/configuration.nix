{ config, lib, pkgs, inputs, ... }: {
  imports =
    [
      ./hardware-configuration.nix
      ./user-configuration.nix
    ];

  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "ayaka-loq15iax9";
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  time.timeZone = "Asia/Kolkata";

  # Enable automatic garbage collection
  nix = {
    gc.automatic = true;
    gc.dates = "daily";
    gc.options = "--delete-older-than 14d";
    settings.auto-optimise-store = true;
  };

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = ["nix-command" "flakes"];

  graphicsModule = {
    intel.enable = true;
    nvidia = {
      enable = true;
      hybrid = {
        enable = true;
        igpu = {
          vendor = "intel";
          port = "PCI:0:2:0";
        };
        dgpu.port = "PCI:1:0:0";
      };
    };
  };

  programsModule = {
    sddm-custom-theme = {
      enable = true;
    };
    hyprland.enable = true;
  };

  # programs.waybar = {
  #   enable = true;    
  # };

  environment.systemPackages = with pkgs; [
    lenovo-legion
    kitty
    matugen
    pavucontrol
    vim
    wget
    lshw
  ];

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "25.05"; # Did you read the comment?

}

