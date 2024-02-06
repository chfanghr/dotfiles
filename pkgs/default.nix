{
  overlay = final: _: {
    sshping = final.callPackage ./sshping.nix {};
  };
}
