{ pkgs, inputs, ... }: {
  environment.systemPackages = with pkgs; [
    # INTERNET
      signal-desktop
      brave
      rclone
      # localsend
      # anydesk
      # parsec-bin
      motrix

    # AUDIO
      easyeffects
      # pavucontrol


    # UTILITIES
      ddcutil
      git
      btop
      p7zip
      exiftool
      unrar
      # droidcam

    # DOWNLOAD
      qbittorrent
      inputs.agenix.packages."${system}".default
      # yt-dlp

    # BOOT & Disk
      gparted
      # efibootmgr
      # ntfs3g

    # GAMES & WINDOWS
      wineWow64Packages.staging # wine-staging (version with experimental features)
      winetricks # winetricks (all versions)
      wineWow64Packages.waylandFull # native wayland support (unstable)
      # javaPackages.compiler.openjdk21
      # parsec-bin
      heroic

    # Cosmetic
      bibata-cursors

    # NVchad
      neovim
      tree-sitter
      ripgrep
      unzip
    
    # Games
      steam-run
      gamemode
  ];

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    # liberation_ttf
    nerd-fonts.intone-mono
  ];

  # services.netbird.enable = true;
  
  /*
  services.sunshine = {
    enable = true;
    autoStart = true;  # optional: starts Sunshine automatically on login
    capSysAdmin = true; 
    openFirewall = true;
  };
  */

}
