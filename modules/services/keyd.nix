{
  services.keyd = {
    enable = true;
    keyboards = {
      default = {
        settings = {
          main = {
            esc = "capslock";
            capslock = "overload(control, esc)";
            # LOL
          };
        };
      };
    };
  };
}