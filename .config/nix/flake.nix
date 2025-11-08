{
  description = "Darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    # Homebrew
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
    # For qmk
    osx-cross-arm = {
      url = "github:osx-cross/homebrew-arm";
      flake = false;
    };
    osx-cross-avr = {
      url = "github:osx-cross/homebrew-avr";
      flake = false;
    };
    qmk = {
      url = "github:qmk/homebrew-qmk";
      flake = false;
    };
    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };
    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };
    homebrew-bundle = {
      url = "github:homebrew/homebrew-bundle";
      flake = false;
    };
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, nix-homebrew, homebrew-core, homebrew-cask, homebrew-bundle, qmk, osx-cross-arm, osx-cross-avr }:
  let
    configuration = { pkgs, config, lib, ... }: {
      nix.enable = false;
      system.primaryUser = "deadpixel";
      nixpkgs.config.allowUnfree = true;
      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      environment.systemPackages = [ 
        pkgs.ansible
        pkgs.asdf-vm
        pkgs.awscli2
        pkgs.fluxcd
        pkgs.fzf
        pkgs.k9s
        pkgs.kubectl
        pkgs.kubeseal
        pkgs.lazygit
        pkgs.mkalias # To handle spotlight shortcuts
        pkgs.nmap
        pkgs.oh-my-posh
        pkgs.stow
        pkgs.terraform
        pkgs.zsh-fzf-tab
      ];

      fonts.packages = [
        pkgs.nerd-fonts.victor-mono
      ];

      homebrew = {
        enable = true;
        onActivation.cleanup = "zap";
        onActivation.autoUpdate = true;
        onActivation.upgrade = true;
        casks = [
            "1password"
            "1password-cli"
            "alfred"
            "discord"
            "ghostty"
            "signal"
            "spotify"
            "whatsapp"
            "wireshark"
        ];
        brews = [
          "caddy"
          "gnupg"
          "gnupg"
          "go"
          "gcc"
          "helm"
          "neovim"
          "node"
          "odin"
          "qmk/qmk/qmk"
          {
            name = "arm-none-eabi-gcc@9";
            link = true;
            conflicts_with = [ "arm-none-eabi-gcc" ];
          }
          {
            name = "avr-gcc@8";
            link = true;
            conflicts_with = [ "avr-gcc" ];
          }
          "pinentry-mac"
          "tilt"
          "tmux"
          "tpm"
          "zig"
          "zsh"
        ];
      };

      system.activationScripts.applications.text = let
        env = pkgs.buildEnv {
          name = "system-applications";
          paths = config.environment.systemPackages;
          pathsToLink = "/Applications";
        };
      in
        pkgs.lib.mkForce ''
        # Set up applications.
        echo "setting up /Applications..." >&2
        rm -rf /Applications/Nix\ Apps
        mkdir -p /Applications/Nix\ Apps
        find ${env}/Applications -maxdepth 1 -type l -exec readlink '{}' + |
        while read -r src; do
          app_name=$(basename "$src")
          echo "copying $src" >&2
          ${pkgs.mkalias}/bin/mkalias "$src" "/Applications/Nix Apps/$app_name"
        done
            '';
      system.activationScripts.activateSettings.enable = true;
      system.activationScripts.activateSettings.text = let
        hotkeys = [
            60 # change input
            61 # change forward input
        ];
        disableHotKeyCommands = map (key:
          "defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add ${toString key} '
    <dict>
      <key>enabled</key><false/>
      <key>value</key>
      <dict>
        <key>type</key><string>standard</string>
        <key>parameters</key>
        <array>
          <integer>65535</integer>
          <integer>65535</integer>
          <integer>0</integer>
        </array>
      </dict>
    </dict>'") hotkeys;
      in ''
        echo >&2 "configuring hotkeys..."
        ${lib.concatStringsSep "\n" disableHotKeyCommands}
        # credit: https://zameermanji.com/blog/2021/6/8/applying-com-apple-symbolichotkeys-changes-instantaneously/
        /System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
      '';

      # nix.package = pkgs.nix;

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # Create /etc/zshrc that loads the nix-darwin environment.
      programs.zsh.enable = true;

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 5;

      # The platform the conf will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";

      system.defaults = {
          dock.autohide = true;
          dock.persistent-apps = [
            "/Applications/Safari.app"
            "/Applications/Ghostty.app"
            "/System/Applications/System\ Settings.app"
            "/System/Applications/Notes.app"
            "/System/Applications/Calendar.app"
            "/System/Applications/Reminders.app"
            "/Applications/1Password.app" # Move to nix
            "/Applications/WhatsApp.app" # Move to nix
            "/Applications/Spotify.app" # Move to nix
            "/Applications/Proton\ Mail.app" # Move to nix
            "/Applications/ProtonVPN.app" # Move to nix
          ];
          finder.ShowPathbar = true;
          finder.FXPreferredViewStyle = "Nlsv";
          loginwindow.GuestEnabled = false;
          NSGlobalDomain.AppleInterfaceStyle = "Dark";
          NSGlobalDomain.KeyRepeat = 2;
      };
    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#simple
    darwinConfigurations."mbp" = nix-darwin.lib.darwinSystem {
      modules = [
        ({ config, ... }: {
          homebrew.taps = builtins.attrNames config.nix-homebrew.taps;
        })
        configuration 
        nix-homebrew.darwinModules.nix-homebrew
        {
          nix-homebrew = {
            autoMigrate = true;
            enable = true;
            enableRosetta = true;
            user = "deadpixel";
            taps = {
              "homebrew/homebrew-core" = homebrew-core;
              "homebrew/homebrew-cask" = homebrew-cask;
              "homebrew/homebrew-bundle" = homebrew-bundle;
              "qmk/homebrew-qmk" = qmk;
              "osx-cross/homebrew-arm" = osx-cross-arm;
              "osx-cross/homebrew-avr" = osx-cross-avr;
            };
            mutableTaps = false;
          };
        }
      ];
    };

    # Expose the package set, including overlays, for convenience.
    darwinPackages = self.darwinConfigurations."mbp".pkgs;
  };
}
