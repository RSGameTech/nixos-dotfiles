{pkgs, ...}: {
  fonts = {
    fontDir.enable = true;
    packages = let
      nerdFonts = with pkgs.nerd-fonts; [
        jetbrains-mono
        fira-code
        fira-mono
      ];
      noto = with pkgs; [
        noto-fonts
        noto-fonts-emoji
        noto-fonts-cjk-sans
        noto-fonts-cjk-serif
        material-symbols
        material-icons
      ];
    in
      nerdFonts ++ noto;
  };
}
