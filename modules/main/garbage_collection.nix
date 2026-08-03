{
  nix.gc = {
    automatic = true;
    dates = "daily";
    options = "--delete-older-than 6d";
  };

  # Also automate the store optimization
  nix.settings.auto-optimise-store = true;
}
