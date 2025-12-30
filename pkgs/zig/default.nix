{
  lib,
  callPackage,
  llvmPackages_18,
  llvmPackages_19,
  llvmPackages_20,
  llvmPackages_21,
  fetchFromGitea,
  zigVersions ? { },
}:
let
  versions = {
    "0.13.0" = {
      llvmPackages = llvmPackages_18;
      hash = "sha256-5qSiTq+UWGOwjDVZMIrAt2cDKHkyNPBSAEjpRQUByFM=";
    };
    "0.14.1" = {
      llvmPackages = llvmPackages_19;
      hash = "sha256-DhVJIY/z12PJZdb5j4dnCRb7k1CmeQVOnayYRP8azDI=";
    };
    "0.15.2" = {
      llvmPackages = llvmPackages_20;
      hash = "sha256-u3pEMcYN71d83MJh14vtzU4DJXnMHu/Jw86d9XvwKE8=";
    };
  }
  // zigVersions;

  mkPackage =
    {
      version,
      hash,
      llvmPackages,
      src ? null,
    }@args:
    callPackage ./generic.nix args;

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
      owner = "anttiharju";
      repo = "zig";
      rev = "github_issue_24662";
      hash = "sha256-r96FH1+hKXvSANOqG4ptyQZ3Sc9irLht+c5KHU+jnY4=";
    };
  };
}
