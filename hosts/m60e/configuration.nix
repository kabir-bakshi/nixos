{ pkgs, inputs, ... }: {
  imports = [ # Include the results of the hardware scan.
    ./hardware-configuration.nix

    ./../../modules/main/boot_grub.nix
    ./../../modules/desktop_environments/xfce.nix
  ];

  boot.loader.grub.extraEntries = ''
    menuentry 'Android-x86' --class android {
      insmod ext2
      set root='(hdX,Y)'
      linux /android/kernel root=/dev/ram0 androidboot.hardware=android_x86 acpi_sleep=s3_bios,s3_mode SRC=/android
      initrd /android/initrd.img
    }
  '';

  networking.hostName = "m60e"; # Define your hostname.

  nixpkgs.overlays = [ inputs.helium-flake.overlays.default ];
  environment.systemPackages = with pkgs; [
    helium
    jdk25
    vlc
  ];

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any re
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  #
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "26.05"; # Did you read the comment?

}

