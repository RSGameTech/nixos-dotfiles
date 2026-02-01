{
  services.keyd = {
    enable = true;
    keyboards = {
      # default = {
      #   settings = {
      #     main = {
      #       esc = "capslock";
      #       capslock = "esc";
      #       # Wonderful piece of software :)
      #     };
      #   };
      # };
      laptop = {
        ids = [ "048d:c996" ];
        settings = {
          main = {
            esc = "capslock";
            capslock = "esc";
          };
        };
      };
    };
  };
}