{...}: {
  imports = [
    ./intel.nix
    ./amd.nix
    ./nvidia.nix
  ];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
}