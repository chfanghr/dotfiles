{pkgs, ...}: {
  environment.systemPackages = [pkgs.pinentry_mac];

  services.pueue.enable = true;
}
