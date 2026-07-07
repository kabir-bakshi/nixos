{ pkgs, ... }: {
  # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = true;
  
  # Enable support for both BIOS and UEFI boot
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.efiInstallAsRemovable = true;
  
  # Define on which hard drive you want to install Grub.
  boot.loader.grub.device = "/dev/sda"; # or "nodev" for efi only

  # boot.loader.grub.useOSProber = true;
}
