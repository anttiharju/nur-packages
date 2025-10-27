{ buildGoModule, fetchFromGitHub }:

buildGoModule {
  pname = "vmatch";
  version = "1.0.28";

  src = fetchFromGitHub {
    owner = "anttiharju";
    repo = "vmatch";
    rev = "3dd6a6eec74f137fb61347b1d4a3c7731bf2cd86";
    hash = "sha256-6OgcNxmSXpnV0IjCyZxLGTgMaUU3yzzuQsV73NTDp7I=";
  };

  vendorHash = null;
}
