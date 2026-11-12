{ pkgs, config, inputs, ... }:
{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix

    ./../../modules/main/boot_systemd.nix
    # ./../../modules/main/flatpak.nix
    ./../../modules/main/time.nix
    # ./../../modules/main/sunshine.nix
    # ./../../modules/desktop_environments/gnome.nix
    # ./../../modules/desktop_environments/cinnamon.nix
    # ./../../modules/desktop_environments/cosmic.nix
    ./../../modules/desktop_environments/niri.nix

    # ./../../modules/extra/waydroid.nix
  ];

  networking.hostName = "latitude-5511";

  # nixpkgs.overlays = [ inputs.affinity-nix.overlays.default ];

  environment.systemPackages = with pkgs; [
      firefox-bin
      dosbox
      stow

      gcc
      
    # INTERNET
      rclone
      motrix
      mpv

    # UTILITIES
      # ddcutil
      btop

    # DOWNLOAD
      # qbittorrent

    # GAMES & WINDOWS
      /*
      wineWow64Packages.staging # wine-staging (version with experimental features)
      winetricks # winetricks (all versions)
      wineWow64Packages.waylandFull # native wayland support (unstable)
      heroic
      */
      gamemode

    # NVchad
      neovim
      tree-sitter
      ripgrep
      unzip
  ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "26.05"; # Did you read the comment?
} 
