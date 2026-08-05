{ config, pkgs, lib, ... }: {
  programs.niri.enable = true;
  services.displayManager.ly.enable = true;


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


  security.wrappers.pkexec.enable = lib.mkForce true;

  # NixOS otherwise injects a stripped PATH via Environment= on the niri.service
  # unit which shadows the imported user-manager PATH. Disabling the default
  # lets niri inherit the full PATH set up by niri-session.
  systemd.user.services.niri.enableDefaultPath = false;

  environment.systemPackages = with pkgs; [
    noctalia-shell

    xwayland-satellite # Highly Recommended, xwayland support

    polkit_gnome

    morewaita-icon-theme

    nautilus
    alacritty

    eog
  ];
}
