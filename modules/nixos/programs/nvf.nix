{
  inputs,
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    programsModule.nvf = {
      enable = lib.mkEnableOption "Enable NVF (Neo Vim Flake)";
    };
  };

  imports = [
    inputs.nvf.nixosModules.default
  ];

  config = lib.mkIf config.programsModule.nvf.enable {
    programs.nvf = {
      enable = true;
      settings = {
        vim = {
          viAlias = true;
          theme = {
            enable = true;
            name = "gruvbox";
            style = "dark";
          };
          statusline.lualine = {
            enable = true;
            theme = "onedark";
            alwaysDivideMiddle = true;
          };
          telescope.enable = true;
          autocomplete.nvim-cmp.enable = true;
          languages = {
            enableTreesitter = true;
            nix.enable = true;
            html.enable = true;
            css.enable = true;
            ts.enable = true;
          };
          options = {
            shiftwidth = 2;
            tabstop = 2;
          };
          visuals.fidget-nvim.setupOpts.integration.nvim-tree.enable = true;
        };
      };
    };
  };
}
