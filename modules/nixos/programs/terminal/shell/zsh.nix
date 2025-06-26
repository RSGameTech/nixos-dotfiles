{...}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      # Listing Files
      ll = "ls -l";
      la = "ls -la";
      # Nix Rebuild Commands
      nrsf = "sudo nixos-rebuild switch --flake";
      # Git Commands
      g = "git";
      gst = "git status";
      ga = "git add";
      gaa = "git add .";
      gb = "git branch";
      gco = "git checkout";
      # gcb = "git checkout -b";
      gc = "git commit";
      gcm = "git commit -m";
      gcl = "git clone";
      gpl = "git pull";
      gps = "git push";
      
      gp = "git push";
      # Extra Commands
      ff = "fastfetch";
    };
  };
}