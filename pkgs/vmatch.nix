{ buildGoModule, fetchFromGitHub }:

buildGoModule {
  pname = "vmatch";
  version = "1.0.26";

  src = fetchFromGitHub {
    owner = "anttiharju";
    repo = "vmatch";
    rev = "8b15b274f8d1483f838b1fa8c8fb9fc6fa52bc80";
    hash = "sha256-FzeTMo4tbrdiaryPtAxUqbR+gjczk3oZgu4Xu2E8A2c=";
  };

  vendorHash = null;
}
