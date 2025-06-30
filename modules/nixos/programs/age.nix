{
  pkgs,
  inputs,
  users,
  ...
}: {
  environment.systemPackages = with pkgs; [
    inputs.agenix.packages.${pkgs.system}.default
  ];
  age.identityPaths = builtins.map (username: "/home/${username}/.ssh/id_ed25519") users;
}