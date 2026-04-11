{
  lib,
  callPackage,
  llvmPackages_21,
  fetchFromGitea,
  zigVersions ? { },
}:
let
  versions = { } // zigVersions;

  mkPackage =
    {
      version,
      hash,
      llvmPackages,
      src ? null,
    }@args:
    callPackage ./generic.nix (args // { inherit lib; });

  zigPackages = lib.mapAttrs' (
    version: args:
    lib.nameValuePair (lib.versions.majorMinor version) (mkPackage (args // { inherit version; }))
  ) versions;
in
zigPackages
// {
  recurseForDerivations = true;
  custom = mkPackage {
    version = "0.16.0-custom";
    llvmPackages = llvmPackages_21;
    hash = ""; # not used since we override src
    src = fetchFromGitea {
      domain = "codeberg.org";
      owner = "ziglang";
      repo = "zig";
      rev = "fa9caeba1b39daccf9096c5f269b605974ce2496";
      hash = "sha256-agKNP0PN12WAPkBWmtHA8Myu0chYzJmY/6f8oeNnV4Y=";
    };
  };
}
