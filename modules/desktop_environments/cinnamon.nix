{ pkgs, ... }: {
  services.xserver.desktopManager.cinnamon.enable = true;

  services.xserver.enable = true;
  services.xserver.displayManager.lightdm.enable = true;

  environment.cinnamon.excludePackages = with pkgs; [
    # blueman
    inkscape
  ];
}
