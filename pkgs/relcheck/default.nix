{ buildGoModule, fetchFromGitHub, git }:

buildGoModule {
  pname = "relcheck";
  version = "1.8.7";

  src = fetchFromGitHub {
    owner = "anttiharju";
    repo = "relcheck";
    rev = "5a5076a4fecebc0a181beec646da179e79b4841c";
    hash = "sha256-NuikzbfKvmRmZjb9Z9Clk+c/LhOOPfEriVRdWPz7gCM=";
  };

  buildInputs = [ git ];

  ldflags = [
    "-s"
    "-w"
    "-X main.revision=5a5076a4fecebc0a181beec646da179e79b4841c"
    "-X main.version=1.8.7"
    "-X main.time=2025-11-08T13:18:23Z"
  ];

  vendorHash = null;
}
