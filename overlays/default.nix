final: prev:
let
  pkgsDir = ../pkgs;
  packageNames = builtins.attrNames (builtins.readDir pkgsDir);

  isDirectory = name: (builtins.readDir pkgsDir).${name} == "directory";
  packageDirs = builtins.filter isDirectory packageNames;

  lib = import ../lib { pkgs = final; };

  packages = builtins.listToAttrs (
    map (name: {
      inherit name;
      value = final.callPackage (pkgsDir + "/${name}") { inherit lib; };
    }) packageDirs
  );
in
packages
