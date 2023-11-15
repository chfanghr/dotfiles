{
  mkDarwinHost = {
    hostName,
    isAppleSilicon ? false,
    extraModules ? [],
  }: {inputs, ...}: {
    flake.darwinConfigurations."${hostName}" = inputs.nix-darwin.lib.darwinSystem {
      system =
        if isAppleSilicon
        then "aarch64-darwin"
        else "x86_64-darwin";
      specialArgs = {inherit inputs;};
      modules =
        [
          {
            imports = [../profiles/darwin];
            darwin.hostName = hostName;
          }
        ]
        ++ extraModules;
    };
  };
}
