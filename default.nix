{ pkgs ? import <nixpkgs> { } }:

let
  lib = import ./lib { inherit pkgs; };

  # Auto-discover packages
  pkgsDir = ./pkgs;
  packageNames = builtins.attrNames (builtins.readDir pkgsDir);
  isDirectory = name: (builtins.readDir pkgsDir).${name} == "directory";
  packageDirs = builtins.filter isDirectory packageNames;

  packages = builtins.listToAttrs (
    map (name: {
      inherit name;
      value = pkgs.callPackage (pkgsDir + "/${name}") { inherit lib; };
    }) packageDirs
  );
in
{
  lib = lib;
  modules = import ./modules; # NixOS modules
  overlays = import ./overlays; # nixpkgs overlays
} // packages
