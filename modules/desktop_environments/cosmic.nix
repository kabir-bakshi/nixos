{ pkgs, ... }: {
  services.displayManager.cosmic-greeter.enable = true;
  services.desktopManager.cosmic.enable = true;
  
  environment.cosmic.excludePackages = with pkgs; [
    cosmic-edit
    cosmic-store
    cosmic-player
    cosmic-monitor
  ];

  services.system76-scheduler.enable = true;

  environment.systemPackages = with pkgs; [
    monocraft
    miracode
  ];

}
