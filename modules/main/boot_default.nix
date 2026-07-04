{ pkgs, ... }: {
  # Boot Config
  boot = {
    consoleLogLevel = 3; # Silence first boot output

    initrd.systemd.enable = true;

    initrd = {
      verbose = false;
    };
    
    kernelParams = [
      "quiet"
      "splash"
      "udev.log_level=3"
    ];

    # Use latest kernel and add modules.
    kernelPackages = pkgs.linuxPackages_latest;

    # extraModulePackages = with config.boot.kernelPackages; [ v4l2loopback.out ];
    # kernelModules = [ "kvm-intel" "v4l2loopback"]; # for virtualisation, virtual camera

    plymouth = {
      enable = true;
      theme = "bgrt";

      /*
      themePackages = with pkgs; [
        # By default we would install all themes
        (adi1090x-plymouth-themes.override {
          selected_themes = [ "splash" ];
        })
      ];
      */

    };
  };
}
