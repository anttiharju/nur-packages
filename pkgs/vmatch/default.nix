{ buildGoModule, fetchFromGitHub }:

buildGoModule {
  pname = "vmatch";
  version = "1.0.33";

  src = fetchFromGitHub {
    owner = "anttiharju";
    repo = "vmatch";
    rev = "28d45393c0abf3fcfe3967d24370d5959f0caf43";
    hash = "sha256-iV6Wtqeo5MnhUVMFlwFxTpk3unO76eynE3JSzGlE6+Q=";
  };

  ldflags = [
    "-s"
    "-w"
  ];

  vendorHash = null;
}
