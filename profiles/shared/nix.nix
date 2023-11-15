{
  nix = {
    gc.automatic = true;
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
        "ca-derivations"
        "recursive-nix"
      ];
      auto-optimise-store = true;
      allow-import-from-derivation = true;
      keep-derivations = true;
      keep-outputs = true;
      substituters = [
        "https://pre-commit-hooks.cachix.org"
        "https://iohk.cachix.org"
        "https://mlabs.cachix.org"
        "https://cache.iog.io"
      ];
      trusted-public-keys = [
        "iohk.cachix.org-1:DpRUyj7h7V830dp/i6Nti+NEO2/nhblbov/8MW7Rqoo="
        "pre-commit-hooks.cachix.org-1:Pkk3Panw5AW24TOv6kz3PvLhlH8puAsJTBbOPmBo7Rc="
        "mlabs.cachix.org-1:gStKdEqNKcrlSQw5iMW6wFCj3+b+1ASpBVY2SYuNV2M="
        "hydra.iohk.io:f/Ea+s+dFdN+3Y/G+FDgSq+a5NEWhJGzdjvKNGv0/EQ="
      ];
    };
  };

  nixpkgs.config.allowUnfree = true;
}
