{
  inputs,
  users,
  ...
}: {
  imports = [ inputs.hjem.nixosModules.default ] ++ builtins.map (username: ./${username}.nix) users;
  hjem.extraModules = [inputs.hjem-impure.hjemModules.default];
}