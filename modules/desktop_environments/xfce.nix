{ pkgs, ... }: {
  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    
    desktopManager = {
      # xterm.emable = false;
      xfce.enable = true;
    };
  };

  services.displayManager.defaultSession = "xfce";

  programs.thunar.plugins = with pkgs.xfce; [
    thunar-archive-plugin
    thunar-volman
  ];

  environment.systemPackages = with pkgs; [
    xfce4-whiskermenu-plugin
  ];
}
