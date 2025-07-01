let
  users = {
    rsgametech = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIC3KM+XdFXPhELWHMc6Dm02N9eEYskYbcfSSqfbUWbsR rsgametech@euthymia"
    ];
  };
  # hosts = {
  #   euthymia = [];
  # };
in {
  "secret1.age".publicKeys = users.rsgametech;
  # "secret2.age".publicKeys = users.rsgametech;
}