{ pkgs, ... }: {
  #### HARDWARE ####

  # Enable backlight support
  hardware.i2c.enable = true;

  
  hardware.graphics = {
    enable = true;
    enable32Bit = true;                     # Crucial for 32-bit games like GTA IV / GTA VC NextGen
    extraPackages = with pkgs; [
      intel-vaapi-driver intel-media-driver # your Open GL, Vulkan and VAAPI drivers
      vpl-gpu-rt                            # for newer GPUs on NixOS >24.05 or unstable
    ];

  };

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };


  #### NETWORKING ####

  networking.networkmanager.enable = true;

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
}
