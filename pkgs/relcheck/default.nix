{ buildGoModule, fetchFromGitHub }:

buildGoModule {
  pname = "relcheck";
  version = "1.8.5";

  src = fetchFromGitHub {
    owner = "anttiharju";
    repo = "relcheck";
    rev = "7b34fd249357c4d54120bef2369ded6a921b2166";
    hash = "sha256-cAwbc1SXGlxaCqKrhk5ChJVRPWQx6EVp8kiMikuqz1g=";
  };

  ldflags = [
    "-s"
    "-w"
    "-X main.revision=7b34fd249357c4d54120bef2369ded6a921b2166"
    "-X main.version=1.8.5"
    "-X main.time=2025-10-28T16:13:40Z"
  ];

  vendorHash = null;
}
