{ pkgs, ... }:
{
  stylix = {
    enable = true;
    polarity = "dark";
    # image = ./../../Media/Wallpapers/Padmanabhaswami.png;
    image = pkgs.fetchurl {
      url = "https://res.cloudinary.com/dmq0bize2/image/upload/v1779381195/Ganesha_UWUnicorn_yntqb1.png"; 
      hash = "sha256-xmWHKIAKbTkalCP9oqa9WTb96bv7hqwATam2+2jx7GI=";
    };
    # cursor = {
      # package = pkgs.bibata-cursors;
      # name = "Bibata-Modern-Amber";
    # };
    base16Scheme = "${pkgs.base16-schemes}/share/themes/uwunicorn.yaml"; # or rose-pine, chalk, da-one-ocean

    targets.plymouth.enable = false;
  };
}
