{
  pkgs,
  lib,
  ...
}: {
  options.darwin = {
    isAppleSilicon = lib.mkOption {
      type = lib.types.bool;
      readOnly = true;
      default = pkgs.system == "darwin-aarch64";
      description = "Is this an apple silicon mac?";
    };

    isDarwin = lib.mkOption {
      type = lib.types.bool;
      readOnly = true;
      default = lib.strings.hasPrefix "darwin-" pkgs.system;
      description = "Is this a mac?";
    };
  };
}
