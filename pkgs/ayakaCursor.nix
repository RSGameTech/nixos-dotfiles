{stdenv}:
stdenv.mkDerivation {
  pname = "ayakaIcon";
  version = "1.0";
  src = builtins.fetchurl {
    url = "https://raw.githubusercontent.com/RSGameTech/nixos-dotfiles/main/assets/Ayaka-Kamisato-Springbloom.tar.gz";
    sha256 = "4186632f0a45581f3e9a60a1beaacc38de8b49d57c5e316106122918bc01140a";
  };

  # dontUnpack = true;

  installPhase = ''
    mkdir -p $out/share/icons/Ayaka_Cursor
    cp -r ./* $out/share/icons/Ayaka_Cursor
  '';
}

# https://github.com/RSGameTech/nixos-dotfiles/raw/refs/heads/main/assets/Ayaka-Kamisato-Springbloom.tar.gz