{
  #### HARDWARE ####

  # Enable backlight support
  hardware.i2c.enable = true;

  /*
  hardware.graphics = {
    enable = true;
    enable32Bit = true; # Crucial for 32-bit games like GTA IV/NextGen
  };
  */

  #### NETWORKING ####

  networking.networkmanager.enable = true;
  services.avahi.enable = false;

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
}
