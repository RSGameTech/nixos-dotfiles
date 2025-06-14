{...}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      ll = "ls -l";
      la = "ls -la";
      gs = "git status";
      gc = "git commit -m";
      ga = "git add .";
      gp = "git push";
      nrsf = "sudo nixos-rebuild switch --flake";
    };
  };
}