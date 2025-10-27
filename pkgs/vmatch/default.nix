{ buildGoModule, fetchFromGitHub }:

buildGoModule {
  pname = "vmatch";
  version = "1.0.25";
  src = fetchFromGitHub {
    owner = "anttiharju";
    repo = "vmatch";
    rev = "a2f740e34357734a92488dd091240b47227b8096";
    hash = "sha256-YXCkg0Hm041g/IhN0tD25NrZH7aOL5j6SYLv5fK0KV8=";
  };
  vendorHash = null;
}
