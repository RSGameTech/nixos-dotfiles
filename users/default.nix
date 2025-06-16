{
  inputs,
  users,
  ...
}: {
  imports = [ inputs.hjem.nixosModules.default ] ++ buildins.map (username: ./${username}.nix) users;
}