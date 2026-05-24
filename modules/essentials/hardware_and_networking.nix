{ pkgs, ... }: {
  #### HARDWARE ####

  # Enable backlight support
  hardware.i2c.enable = true;

  
  hardware.graphics = {
    enable = true;
    # enable32Bit = true; # Crucial for 32-bit games like GTA IV/NextGen
    extraPackages = with pkgs; [
      intel-vaapi-driver intel-media-driver # your Open GL, Vulkan and VAAPI drivers
      vpl-gpu-rt          # for newer GPUs on NixOS >24.05 or unstable
      # onevpl-intel-gpu  # for newer GPUs on NixOS <= 24.05
      # intel-media-sdk   # for older GPUs
    ];

  };
  

  #### NETWORKING ####

  networking.networkmanager.enable = true;
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    publish = {
      enable = true;
      addresses = true;
    };
  };
  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
}
