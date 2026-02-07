{
  services.openssh = {
    enable = true;
    openFirewall = true;
    startWhenNeeded = true;
    settings = {
      PasswordAuthentication = true;
      UseDns = true;
    };
  };
}