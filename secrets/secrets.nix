let
  users = {
    rsgametech = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIC3KM+XdFXPhELWHMc6Dm02N9eEYskYbcfSSqfbUWbsR rsgametech@euthymia"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEVG8eX7UUHMY6PsGF+NPE0Z8+fV4BHnveFIuCot48Jl rsgame0604@gmail.com"
    ];
  };
  hosts = {
    # euthymia = [];
    irminsul = ["ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFYVKHo5kx8MzrgjZXzgDCd32flNDqqMfTAMigsB+oB8 rsgametech@irminsul"];
  };
in {
  "secret1.age".publicKeys = users.rsgametech;
  # "secret2.age".publicKeys = users.rsgametech;
}