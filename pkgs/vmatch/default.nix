{ buildGoModule, fetchFromGitHub }:

buildGoModule {
  pname = "vmatch";
  version = "1.0.31";

  src = fetchFromGitHub {
    owner = "anttiharju";
    repo = "vmatch";
    rev = "0d6f0bdf62c10fba972431d1419c168a27342a24";
    hash = "sha256-XYtfBjLy9NJTbfOw4os3Mpt21E0obeiz8FIW/YSM+yI=";
  };

  vendorHash = null;
}
