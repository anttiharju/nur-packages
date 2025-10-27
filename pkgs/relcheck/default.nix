{ buildGoModule, fetchFromGitHub }:

buildGoModule {
  pname = "relcheck";
  version = "1.8.2";

  src = fetchFromGitHub {
    owner = "anttiharju";
    repo = "relcheck";
    rev = "c6fd1019d875fdd415ce0bc10ec5a6261b696ee5";
    hash = "sha256-Q7e9EaBaW+G8UUDVPvDHq1DOqQLn57l+hondjRKg6EI=";
  };

  vendorHash = null;
}
