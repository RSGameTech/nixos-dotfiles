{...}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableBashCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting = {
      enable = true;
      highlighters = [ "main" "brackets" "pattern" "root" "line" ];
      styles = {
        "alias" = "bold";
        "path" = "underline";
      };
    };
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
      # Extra Commands
      ff = "fastfetch";
    };
    ohMyZsh = {
      enable = true;
      theme = "agnoster";
      plugins = [ "git" "z"];
    };
  };
}