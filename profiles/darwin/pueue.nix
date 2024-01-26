{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.services.pueue;
  yamlFormat = pkgs.formats.yaml {};
  configFile = yamlFormat.generate "pueue.yaml" cfg.settings;
in {
  options.services.pueue = {
    enable = mkEnableOption "Pueue, CLI process scheduler and manager";

    package = mkPackageOption pkgs "pueue" {};

    settings = mkOption {
      type = yamlFormat.type;
      default = {};
      example = literalExpression ''
        {
          daemon = {
            default_parallel_tasks = 2;
          };
        }
      '';
    };
  };

  config = mkIf cfg.enable {
    environment.systemPackages = [
      cfg.package
    ];

    launchd.user.agents.pueued = {
      command = "${cfg.package}/bin/pueued -v -c ${configFile}";

      serviceConfig = {
        KeepAlive = true;
        RunAtLoad = true;
      };
    };
  };
}
