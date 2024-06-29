{
  homebrew = {
    enable = true;
    onActivation = {
      # "zap" removes manually installed brews and casks
      cleanup = "zap";
      autoUpdate = true;
      upgrade = true;
    };
    global.lockfiles = true;
    taps = [
      {
        name = "apple/apple";
        clone_target = "https://github.com/apple/homebrew-apple.git";
        force_auto_update = true;
      }
    ];
    masApps = {
      Xcode = 497799835;
      Playgrounds = 1496833156;
      # QOL
      Magnet = 441258766;
      Discovery = 1381004916;
      Tailscale = 1475387142;
      "Raivo OTP" = 1498497896;
      # Music
      "Pine Player" = 1112075769;
      LyricsX = 1254743014;
      # Safari Plugins
      Tampermonkey = 1482490089;
      "AdGuard for Safari" = 1440147259;
      "Grammarly for Safari" = 1462114288;
      "Sourcegraph for Safari" = 1543262193;
      # Work Stuff
      Slack = 803453959;
      Harvest = 506189836;
      # Steam
      "Steam Link" = 1246969117;
      # FIXME: Shadowrocket = ??? doesn't work atm
    };
    brews = [
      # FIXME: requires arch -x86_64 wrapper
      # "game-porting-toolkit"
      "game-porting-toolkit-compiler"
      "openjdk@17"
      "podman"
    ];
    casks = [
      "spotify"
      "google-chrome"
      "notion"
      "grammarly-desktop"
      "orbstack"
      # NOTE: use home-manager
      # "kitty"
      "foobar2000"
      "calibre"
      "utm"
      "discord"
      "visual-studio-code"
      "shottr"
      "vlc"
      "obs"
      "keycastr"
      "xnviewmp"
      "iterm2"
      "imhex"
    ];
  };
}
