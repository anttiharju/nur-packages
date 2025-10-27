{ buildGoModule, fetchFromGitHub }:

buildGoModule {
  pname = "vmatch";
  version = "1.0.29";

  src = fetchFromGitHub {
    owner = "anttiharju";
    repo = "vmatch";
    rev = "d4e108f4b9108b5749ec4d492cd80e94e26861f0";
    hash = "sha256-6Vy9OB2g2oRtAo5BIr8fB/UdFuf8ZTgsgJVja58+xp4=";
  };

  vendorHash = null;
}
