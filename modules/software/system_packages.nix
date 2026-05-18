{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    brave                           # Browser
    rclone                          # Backup
      tree-sitter                     # Prerequisite for NVchad
      ripgrep                         # same as above
      unzip                           # Z-Archives
    # anydesk                         # Remote desktop
    ddcutil                         # Backlight control
    # localsend                       # File share
    easyeffects                     # Equaliser and other
    qbittorrent                     # Download manager
    git                             # Version control
    gparted                         # Editing disk partitions
    # efibootmgr                      # Editing nvram
    btop                            # Task manager
    # javaPackages.compiler.openjdk21 # Java
    neovim                          # Code Editor
    p7zip                           # zipping and unzipping tool
    gnome-extension-manager
    # ntfs3g
    # yt-dlp
    # parsec-bin
    exiftool
    signal-desktop
    droidcam
    # pavucontrol
    gamemode

    # GNOME
      nautilus
      refine
      eog
      gnome-terminal

    # KDE
      kdePackages.okular

    # Extensions
      gnomeExtensions.dash-to-dock
      gnomeExtensions.paperwm
      # gnomeExtensions.hide-top-bar # paperwm has it as a shortcut
      gnomeExtensions.appindicator

    # GAMES & WINDOWS
      wineWow64Packages.staging # wine-staging (version with experimental features)
      winetricks # winetricks (all versions)
      wineWow64Packages.waylandFull # native wayland support (unstable)
      # parsec-bin

    # Cosmetic
      bibata-cursors

      steam-run
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
