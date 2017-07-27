with import (fetchTarball {
  url = "https://github.com/nixos/nixpkgs/archive/00512470ec241949148b61e1c120fa76d685cf9a.tar.gz";
}) {};
let
  nodejs = nodejs-8_x;
  yarn2nix = (import (fetchTarball {
    url = "https://github.com/zimbatm/yarn2nix/archive/e3534d6071b9b6517bbc4e3fdfccf377c96a3c12.tar.gz";
  }) { inherit pkgs nodejs; });
in
yarn2nix.mkYarnPackage {
  name = "myapp";
  packageJSON = ./package.json;
  yarnLock = ./yarn.lock;
  src = ./.;
  publishBinsFor = [ "myapp" ];
  preConfigure = ''
    rm -rf $out/node_modules
  '';
}
