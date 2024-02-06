{
  specialArgs,
  config,
  pkgs,
  ...
}: {
  users.users.fanghr.home = "/Users/fanghr";

  home-manager.users.fanghr = let
    yamlFormat = pkgs.formats.yaml {};
    pueueConfigFile = yamlFormat.generate "pueue.yaml" (config.services.pueue.settings
      // {
        client = {
          restart_in_place = false;
          read_local_logs = true;
          show_confirmation_questions = false;
          show_expanded_aliases = false;
          dark_mode = false;
          max_status_height = null;
          status_time_format = "%H:%M:%S";
          status_datetime_format = "%Y-%m-%d\n%H:%M:%S";
        };
      });
  in {
    home.file."Library/Application Support/pueue/pueue.yml".source = pueueConfigFile;
    imports = [specialArgs.inputs.mac-home.outputs.homeModules.fanghr];
  };
  nixpkgs.overlays = [
    specialArgs.inputs.mac-home.outputs.overlays.default
    (import ../../pkgs).overlay
  ];
}
