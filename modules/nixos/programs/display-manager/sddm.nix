{
  pkgs,
  inputs,
  lib,
  config,
  ...
}: {
  options = {
    programsModule.displayManager.sddm = {
      enable = lib.mkEnableOption "Enable SDDM display manager";
      # theme = lib.mkOption {
      #   type = lib.types.str;
      #   default = "breeze";
      #   description = "The SDDM theme to use.";
      # }
    };
  };

  config = let
      silentSDDM = inputs.silentSDDM.packages.${pkgs.system}.default.override {
        theme = "rei";
      };
    in
      lib.mkIf config.programsModule.displayManager.sddm.enable {
        environment.systemPackages = [silentSDDM silentSDDM.test];
        qt.enable = true;
        services.displayManager.sddm = {
          enable = true;
          package = pkgs.kdePackages.sddm;
          theme = silentSDDM.pname;
          extraPackages = [
            pkgs.kdePackages.qtmultimedia
            pkgs.kdePackages.qtsvg
            pkgs.kdePackages.qt5compat
            pkgs.kdePackages.qtimageformats
          ] ++ silentSDDM.propagatedBuildInputs;
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