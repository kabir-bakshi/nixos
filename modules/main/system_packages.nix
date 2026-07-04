{ pkgs, inputs, ... }: {
  environment.systemPackages = with pkgs; [
    # AUDIO
      easyeffects
      # pavucontrol
    
    # UTILITIES
      ddcutil

      p7zip
      unrar

      neovim
      git

    # BOOT & Disk
      gparted
      # efibootmgr
      # ntfs3g

    # Cosmetic
      bibata-cursors


  ];

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji

    nerd-fonts.intone-mono
  ];
}
