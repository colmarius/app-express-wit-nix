with import (fetchTarball {
  url = "https://github.com/nixos/nixpkgs/archive/00512470ec241949148b61e1c120fa76d685cf9a.tar.gz";
}) {};
let
  myapp = import ./.;
in
dockerTools.buildImage {
  name = "myapp-docker";
  contents = [ myapp ];
}
