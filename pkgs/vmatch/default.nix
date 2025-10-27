{ buildGoModule, fetchFromGitHub }:

buildGoModule {
  pname = "vmatch";
  version = "1.0.27";

  src = fetchFromGitHub {
    owner = "anttiharju";
    repo = "vmatch";
    rev = "78ae6d0301e00201fb42c5f432ec2740c9ed1047";
    hash = "sha256-aypXfXZZIxtgpMUm/ta+AdwIm+OQ6jDLPANcVR4NK8Y=";
  };

  vendorHash = null;
}
