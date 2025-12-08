{...}: {
  programs.adb = {
    enable = true;
  };
  users.users.rsgametech.extraGroups = ["adbusers" "kvm"];
}