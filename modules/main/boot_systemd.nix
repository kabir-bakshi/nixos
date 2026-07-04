{
  boot = {
    loader = { 
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };

    kernelParams = [
      "systemd.show_status=auto"
    ];
  };
}
