{ pkgs, ... }: {
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;
  
  services.gnome.core-apps.enable = false;
  
  environment.systemPackages = with pkgs; [
  # GNOME
    nautilus
    refine
    eog
    gnome-terminal
    gnome-extension-manager

  # KDE
    kdePackages.okular

  # Extensions
    gnomeExtensions.dash-to-dock
    gnomeExtensions.dockng
    gnomeExtensions.paperwm
    gnomeExtensions.appindicator
  ];
}
