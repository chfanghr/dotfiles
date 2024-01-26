{specialArgs, ...}: {
  users.users.fanghr.home = "/Users/fanghr";

  home-manager.users.fanghr = specialArgs.inputs.mac-home.outputs.homeModules.fanghr;

  nixpkgs.overlays = [specialArgs.inputs.mac-home.outputs.overlays.default];
}
