{
  imports = [
    ../shared
    ./nix.nix
    ./users.nix
    ./hostName.nix
    ./homebrew.nix
    ./home-manager.nix
    ./tools.nix
    ./pueue.nix
  ];

  security.pam.enableSudoTouchIdAuth = true;

  system.stateVersion = 4;
}
