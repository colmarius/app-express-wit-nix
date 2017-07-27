with import (fetchTarball {
  url = "https://github.com/nixos/nixpkgs/archive/00512470ec241949148b61e1c120fa76d685cf9a.tar.gz";
}) {};
stdenv.mkDerivation {
  name = "myapp";
  buildInputs = [
    bashInteractive
    nodejs-8_x
    yarn
  ];
}
