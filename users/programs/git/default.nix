{...}: {
  programs.git = {
    enable = true;
    config = {
      init = {
        defaultBranch = "main";
      };
      user = {
        name = "RSGameTech";
        email = "rsgame0604@gmail.com";
      };
    };
  };
}