{
  pkgs,
  config,
  ...
}: {
  launchd.daemons.generate-nix-cache-key = {
    serviceConfig = {
      LaunchOnlyOnce = true;
      RunAtLoad = true;
    };
    path = [pkgs.nix];
    script = ''
      [[ -f /etc/nix/private-key ]] && exit
      nix-store --generate-binary-cache-key ${config.networking.hostName}-1 /etc/nix/private-key /etc/nix/public-key
    '';
  };
  nix.extraOptions = ''
    secret-key-files = /etc/nix/private-key
  '';
}
