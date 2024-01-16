{
  description = "Hongrui Fang's machine configurations";

  inputs = {
    nixpkgs.follows = "nix-darwin/nixpkgs";

    nix-darwin = {
      url = "github:LnL7/nix-darwin/master";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = {flake-parts, ...} @ inputs:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = [
        "x86_64-darwin"
        "aarch64-darwin"
        "x86_64-linux"
        "aarch64-linux"
      ];
      imports = [
        ./hosts
      ];
      perSystem = {};
    };
}
