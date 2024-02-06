{
  lib,
  stdenv,
  fetchFromGitHub,
  libssh,
}:
stdenv.mkDerivation rec {
  pname = "sshping";
  version = "v0.1.5beta1";

  src = fetchFromGitHub {
    owner = "spook";
    repo = "sshping";
    rev = "b2e7c40820646561ffc03046ed85e5645a7c27eb";
    sha256 = "1g1zkd4n2hydp9rv8j9w0f39c9k0lsv7zhzsiam92bs5h3mvcjnv";
  };

  buildInputs = [libssh];

  buildPhase = ''
    $CXX -Wall -I ext/ -o bin/sshping src/sshping.cxx -lssh
  '';

  installPhase = ''
    install -Dm755 bin/sshping $out/bin/sshping
  '';

  meta = with lib; {
    homepage = "https://github.com/spook/sshping";
    description = "Measure character-echo latency and bandwidth for an interactive ssh session";
    license = licenses.mit;
    platforms = platforms.unix;
  };
}
