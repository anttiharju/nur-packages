{ buildGoModule, fetchFromGitHub }:

buildGoModule {
  pname = "relcheck";
  version = "1.8.1";

  src = fetchFromGitHub {
    owner = "anttiharju";
    repo = "relcheck";
    rev = "7adc1fc1d8625aedf8816c89c41af7c569188616";
    hash = "sha256-k2uS0ye+Sv3kZS0mOjM//Iv8nmIKY16OA+FgkHztzIw=";
  };

  vendorHash = null;
}
