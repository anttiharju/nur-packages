{ buildGoModule, fetchFromGitHub }:

buildGoModule {
  pname = "vmatch";
  version = "1.0.45";

  src = fetchFromGitHub {
    owner = "anttiharju";
    repo = "vmatch";
    rev = "e8ec3e6c0f0442fb3d6ce9925b15adb59db4e844";
    hash = "sha256-2HYvypi8Wo0660AWriexZm8h9dyJSMTb08nOSAE0pOY=";
  };

  ldflags = [
    "-s"
    "-w"
    "-X main.revision=e8ec3e6c0f0442fb3d6ce9925b15adb59db4e844"
    "-X main.version=1.0.45"
    "-X main.time=2025-10-28T16:43:18Z"
  ];

  vendorHash = null;
}
