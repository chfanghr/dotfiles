{
  lib,
  config,
  ...
}: {
  options.darwin.hostName = lib.mkOption {
    type = lib.types.nonEmptyStr;
  };

  config.networking = {
    hostName = config.darwin.hostName;
    localHostName = config.darwin.hostName;
  };
}
