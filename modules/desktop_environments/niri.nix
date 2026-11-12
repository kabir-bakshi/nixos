{ config, pkgs, lib, ... }: {
  programs.niri.enable = true;
  # services.displayManager.ly.enable = true;
  
  programs.dms-greeter = {
    enable = true;
    compositor.name = "niri"; # or hyprland, sway, labwc, mango, scroll, miracle, aqueous
    configHome = "/home/kabir"; # copies that user's DMS settings (and wallpaper) into the greeter data directory before greetd starts
  };
  
  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;

  # For apps that require authentication
  security.polkit.enable = true; # Security Guard
  services.gnome.gnome-keyring.enable = true; # secret service
  
  systemd.user.services.polkit-gnome-authentication-agent-1 = {
      description = "polkit-gnome-authentication-agent-1";
      wantedBy = [ "graphical-session.target" ];
      wants = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
    };

  programs.dux-shell = {
    enable = true;

    systemd = {
      enable = true;             # Systemd service for auto-start
      restartIfChanged = true;   # Auto-restart dms.service when dms-shell changes
    };
    
    /*
    # Core features
    enableSystemMonitoring = true;     # System monitoring widgets (dgop)
    # enableVPN = true;                  # VPN management widget
    enableDynamicTheming = true;       # Wallpaper-based theming (matugen)
    enableAudioWavelength = true;      # Audio visualizer (cava)
    enableCalendarEvents = true;       # Calendar integration (khal)
    */
  };

  security.wrappers.pkexec.enable = lib.mkForce true;

  # NixOS otherwise injects a stripped PATH via Environment= on the niri.service
  # unit which shadows the imported user-manager PATH. Disabling the default
  # lets niri inherit the full PATH set up by niri-session.
  systemd.user.services.niri.enableDefaultPath = false;

  environment.systemPackages = with pkgs; [
    # noctalia-shell
    
    # quickshell
    # dms-shell

    xwayland-satellite # Highly Recommended, xwayland support

    polkit_gnome

    # morewaita-icon-theme

    nautilus
    alacritty

    eog
  ];
}
