{ pkgs, ... }:
{
  stylix = {
    enable = true;
    polarity = "dark";
    image = ./../../Media/Wallpapers/Padmanabhaswami.png;
    # cursor = {
      # package = pkgs.bibata-cursors;
      # name = "Bibata-Modern-Amber";
    # };
    targets.plymouth.enable = false;
      base16Scheme = "${pkgs.base16-schemes}/share/themes/uwunicorn.yaml"; # or rose-pine, chalk, da-one-ocean
  };
}
