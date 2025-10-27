{ buildGoModule, fetchFromGitHub }:

buildGoModule {
  pname = "vmatch";
  version = "1.0.30";

  src = fetchFromGitHub {
    owner = "anttiharju";
    repo = "vmatch";
    rev = "876c4d13e8fb60b1147cb02fd7d30e76ec9b2c8d";
    hash = "sha256-KS6VUuUK68Bggt1/T/jPiqWGafgR/HwDD3Gebg634zU=";
  };

  vendorHash = null;
}
