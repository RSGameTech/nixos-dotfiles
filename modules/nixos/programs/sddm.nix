{
  inputs,
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    programsModule.sddm-silent-theme = {
      enable = lib.mkEnableOption "Enable sddm silent theme";
      # wallpaper = lib.mkOption {
      #   default = ./suzume-door.png;
      # };
    };
  };

  config = let
    silentSDDM = inputs.silentSDDM.packages.${pkgs.system}.default.override {
      theme = "rei"; # select the config of your choice
    };
  in
    lib.mkIf config.programsModule.sddm-silent-theme.enable {
      environment.systemPackages = [silentSDDM silentSDDM.test];
      qt.enable = true;
      services.displayManager.sddm = {
        enable = lib.mkDefault true;
        theme = silentSDDM.pname;
        extraPackages = silentSDDM.propagatedBuildInputs;
        wayland.enable = true;
        settings = {
          General = {
            GreeterEnvironment = "QML2_IMPORT_PATH=${silentSDDM}/share/sddm/themes/${silentSDDM.pname}/components/,QT_IM_MODULE=qtvirtualkeyboard";
            InputMethod = "qtvirtualkeyboard";
          };
        };
      };
    };
}