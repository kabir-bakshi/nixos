{
  imports = [
    ./main/boot_default.nix
    ./main/hardware_and_networking.nix
    ./main/time.nix
    ./main/audio_pipewire.nix
    
    ./main/users_and_rules.nix

    ./main/enable_flakes.nix
    ./main/system_packages.nix
    ./main/garbage_collection.nix
    
    ./main/locale.nix
    ./main/ip.nix

    # ./desktop_environments/stylix.nix

    ./extra/community_compiled_binaries.nix 
  ];

  nixpkgs.config.allowUnfree = true;
}
