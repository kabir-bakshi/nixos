{ config, pkgs, ... }:
{
  programs.niri.enable = true;
  services.displayManager.ly.enable = true;

  /*
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${config.programs.niri.package}/bin/niri-session";
        # user = "kabir";
      };
    };
  };
  */

  # NixOS otherwise injects a stripped PATH via Environment= on the niri.service
  # unit which shadows the imported user-manager PATH. Disabling the default
  # lets niri inherit the full PATH set up by niri-session.
  systemd.user.services.niri.enableDefaultPath = false;

  # security.polkit.enable = true; # polkit
  # services.gnome.gnome-keyring.enable = true; # secret service
  # security.pam.services.swaylock = {};

  # programs.waybar.enable = true; # top bar
  environment.systemPackages = with pkgs; [
    alacritty
    fuzzel
    
    thunar
    # wl-clipboard
    # swaylock
    # mako
    # swayidle
  ];
  
  # Enabling DankMaterialShell
  programs.dms-shell = {
    enable = true;
 
    systemd = {
      enable = true;             # Systemd service for auto-start
      restartIfChanged = true;   # Auto-restart dms.service when dms-shell changes
    };
    
    # Core features
      # enableSystemMonitoring = true;     # System monitoring widgets (dgop)
      # enableVPN = true;                  # VPN management widget
      enableDynamicTheming = true;       # Wallpaper-based theming (matugen)
      enableAudioWavelength = true;      # Audio visualizer (cava)
      enableCalendarEvents = true;       # Calendar integration (khal)
  };
  
  /*
  security.pam.services."dankshell-u2f".text = ''
    auth     required ${pkgs.pam_u2f}/lib/security/pam_u2f.so cue
    account  required pam_permit.so
  '';
  */

}
