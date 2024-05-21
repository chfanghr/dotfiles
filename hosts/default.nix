{inputs, ...}: {
  flake.darwinConfigurations = {
    Hera = inputs.nix-darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      specialArgs = {inherit inputs;};
      modules = [
        {
          imports = [../profiles/darwin];
          darwin.hostName = "Hera";
        }
      ];
    };
    Hermes = inputs.nix-darwin.lib.darwinSystem {
      system = "x86_64-darwin";
      specialArgs = {inherit inputs;};
      modules = [
        {
          imports = [../profiles/darwin];
          darwin.hostName = "Hermes";
        }
      ];
    };
  };
}
