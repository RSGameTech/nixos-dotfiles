{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    programsModule.sddm-custom-theme = {
      enable = lib.mkEnableOption "Enable custom SDDM theme";
      wallpaper = lib.mkOption {
        default = ./suzume-door.png;
      };
    };
  };

  config = let
    cfg = config.programsModule.sddm-custom-theme;
  in
    lib.mkIf cfg.enable {
      environment.systemPackages = let
        sddm-astronaut = pkgs.sddm-astronaut.override {
          themeConfig = {
            Background = "${cfg.wallpaper}";
            PartialBlur = "true";
            Blur = 0.0;
            FormPosition = "right";
            HideLoginButton = true;
            HideVirtualKeyboard = true;
            # RoundCorners = 0;

            # COLORS
            # LoginButtonBackgroundColor="#313FAB";
            # HoverVirtualKeyboardButtonTextColor="#313FAB";
            HoverUserIconColor = "#313FAB";
            HoverPasswordIconColor = "#313FAB";
            HoverSystemButtonsIconsColor = "#313FAB";
            HoverSessionButtonTextColor = "#313FAB";

            # Extra stuff for fine tuning colors (maybe later)
            # HeaderTextColor="#ffffff";
            # DateTextColor="#ffffff";
            # TimeTextColor="#ffffff";
            # FormBackgroundColor="#21222C";
            # BackgroundColor="#21222C";
            # DimBackgroundColor="#21222C";

            # LoginFieldBackgroundColor="#222222";
            # PasswordFieldBackgroundColor="#222222";
            # LoginFieldTextColor="#ffffff";
            # PasswordFieldTextColor="#ffffff";
            # UserIconColor="#ffffff";
            # PasswordIconColor="#ffffff";

            # PlaceholderTextColor="#bbbbbb";
            # WarningColor="#343746";

            # LoginButtonTextColor="#ffffff";
            # SystemButtonsIconsColor="#F8F8F2";
            # SessionButtonTextColor="#F8F8F2";
            # VirtualKeyboardButtonTextColor="#F8F8F2";

            # DropdownTextColor="#ffffff";
            # DropdownSelectedBackgroundColor="#343746";
            # DropdownBackgroundColor="#21222C";

            # HighlightTextColor="#bbbbbb";
            # HighlightBackgroundColor="#343746";
            # HighlightBorderColor="#343746";
          };
        };
      in [
        sddm-astronaut
        pkgs.kdePackages.qtmultimedia
      ];

      services.displayManager.sddm = {
        enable = lib.mkDefault true;
        wayland.enable = true;
        enableHidpi = true;
        settings.Theme.CursorSize = 26;
      };
    };
}