{
  lib,
  config,
  ...
}: {
  services.nix-daemon.enable = true;

  nix = {
    gc = {
      interval = {Month = 1;};
      options = "--delete-older-than 60d";
    };
    settings = {
      extra-sandbox-paths = [
        "/System/Library/Frameworks"
        "/System/Library/PrivateFrameworks"
        "/usr/lib"
        "/private/tmp"
        "/private/var/tmp"
        "/usr/bin/env"
      ];
      extra-platforms = let
        inherit (lib.lists) optional;
        isAppleSilicon = config.darwin.isAppleSilicon;
      in
        ["x86_64-darwin"]
        ++ optional isAppleSilicon "aarch-64-darwin";
      substituters = [
        "https://cache.zw3rk.com"
      ];
      trusted-public-keys = [
        "loony-tools:pr9m4BkM/5/eSTZlkQyRt57Jz7OMBxNSUiMC4FkcNfk="
      ];
      trusted-users = ["@admin"];
      auto-optimise-store = lib.mkForce false;
    };
    linux-builder = {
      enable = true;
    };
  };

  imports = [./generate-nix-cache-key.nix];
}
