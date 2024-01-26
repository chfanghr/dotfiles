{pkgs, ...}: {
  environment.systemPackages = [pkgs.pinentry_mac];

  imports = [./pueue.nix];

  services.pueue.enable = true;
}
