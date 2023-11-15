{
  specialArgs,
  pkgs,
  ...
}: {
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
  };

  environment.systemPackages = [
    specialArgs.inputs.home-manager.packages."${pkgs.system}".home-manager
  ];
}
