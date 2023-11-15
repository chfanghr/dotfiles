{
  imports = [
    ../shared
    ./nix.nix
    ./users.nix
    ./hostName.nix
    ./homebrew.nix
    ./home-manager.nix
  ];

  system.stateVersion = 4;
}
