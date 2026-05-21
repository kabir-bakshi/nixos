{
  imports = [
    ./essentials/boot.nix
    ./essentials/hardware_and_networking.nix
    ./essentials/time.nix
    ./essentials/audio_pipewire.nix
    ./essentials/users_and_rules.nix
    ./essentials/enable_flakes.nix

    ./desktop_environments/stylix.nix

    ./software/system_packages.nix
    ./software/flatpak.nix

    ./extra/community_compiled_binaries.nix 
  ];
}
