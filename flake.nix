{
  description = "Hongrui Fang's machine configurations";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";

    darwin = {
      url = "github:LnL7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    darwin,
    home-manager,
    ...
  } @ inputs: {
    darwinConfigurations.Hera = darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      specialArgs = {inherit inputs;};
      modules = [
        {
          networking = {
            hostName = "Hera";
            localHostName = "Hera";
          };
        }
        {
          nixpkgs = {
            config.allowUnfree = true;
          };
          system.stateVersion = 4;
        }
        {
          services.nix-daemon.enable = true;
          nix = {
            gc = {
              automatic = true;
              interval = {Month = 1;};
              options = "--delete-older-than 60d";
            };
            settings = {
              experimental-features = [
                "nix-command"
                "flakes"
                "ca-derivations"
                "recursive-nix"
              ];
              extra-sandbox-paths = [
                "/System/Library/Frameworks"
                "/System/Library/PrivateFrameworks"
                "/usr/lib"
                "/private/tmp"
                "/private/var/tmp"
                "/usr/bin/env"
              ];
              extra-platforms = ["x86_64-darwin" "aarch64-darwin"];
              auto-optimise-store = true;
              allow-import-from-derivation = true;
              keep-derivations = true;
              keep-outputs = true;
              substituters = [
                "https://pre-commit-hooks.cachix.org"
                "https://iohk.cachix.org"
                "https://mlabs.cachix.org"
                "https://cache.iog.io"
                # "https://cache.zw3rk.com"
              ];
              trusted-public-keys = [
                "iohk.cachix.org-1:DpRUyj7h7V830dp/i6Nti+NEO2/nhblbov/8MW7Rqoo="
                "pre-commit-hooks.cachix.org-1:Pkk3Panw5AW24TOv6kz3PvLhlH8puAsJTBbOPmBo7Rc="
                "mlabs.cachix.org-1:gStKdEqNKcrlSQw5iMW6wFCj3+b+1ASpBVY2SYuNV2M="
                "hydra.iohk.io:f/Ea+s+dFdN+3Y/G+FDgSq+a5NEWhJGzdjvKNGv0/EQ="
                # "loony-tools:pr9m4BkM/5/eSTZlkQyRt57Jz7OMBxNSUiMC4FkcNfk="
              ];
              trusted-users = [ "@admin" ];
            };
            linux-builder = { enable = true; };
          };
        }
        {
          programs = {
            zsh.enable = true;

            gnupg.agent = {
              enable = true;
              enableSSHSupport = true;
            };

            vim.enable = true;

            nix-index.enable = true;
          };
        }
        ({pkgs, ...}: {
          environment.systemPackages = with pkgs; [
            curl
            rsync
            cachix
            helix
            btop
          ];
        })
        {
          security.pam.enableSudoTouchIdAuth = true;
        }
        ({pkgs, ...}: {
          users.users.fanghr = {
            shell = pkgs.zsh;
            home = "/Users/fanghr";
          };
        })
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
            ];
            casks = [
              "spotify"
              "google-chrome"
              "notion"
              "grammarly-desktop"
              "gpg-suite-no-mail"
              "orbstack"
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
            ];
          };
        }
        home-manager.darwinModule
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            # users.fanghr = {
            #   imports = [];
            #   home.stateVersion = "23.05";
            # };
          };
        }
      ];
    };
  };
}
