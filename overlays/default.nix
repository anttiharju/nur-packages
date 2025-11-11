final: prev:
let
  pkgsDir = ../pkgs;
  packageNames = builtins.attrNames (builtins.readDir pkgsDir);

  isDirectory = name: (builtins.readDir pkgsDir).${name} == "directory";
  packageDirs = builtins.filter isDirectory packageNames;

  packages = builtins.listToAttrs (
    map (name: {
      inherit name;
      value = final.callPackage (pkgsDir + "/${name}") { };
    }) packageDirs
  );
in
packages
