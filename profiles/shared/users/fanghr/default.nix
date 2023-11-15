{
  lib,
  pkgs,
  ...
}: {
  programs.zsh.enable = lib.mkForce true;
  users.users.fanghr = {
    openssh.authorizedKeys.keys = lib.importJSON ./ssh-public-keys.json;
    shell = pkgs.zsh;
    description = "Hongrui Fang";
  };
}
