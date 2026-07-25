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

  programs.thunar.plugins = with pkgs; [
    thunar-archive-plugin
    thunar-volman
  ];

  environment.systemPackages = with pkgs; [
    xfce4-whiskermenu-plugin
    pamixer # For volume control commands.
            #   pamixer -i 5; # increase vol
            #   pamixer -d 5; # decrease vol
            #   pamixer -t;   # toggle mute
  ];

  services.blueman.enable = true;
}
