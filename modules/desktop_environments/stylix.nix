{ pkgs, ... }:
{
  stylix = {
    enable = true;
    polarity = "dark";
    # image = ./../../Media/Wallpapers/Padmanabhaswami.png;
    image = pkgs.fetchurl {
      url = "https://res.cloudinary.com/dmq0bize2/image/upload/v1782129113/beach_xib5nw.png"; 
      hash = "sha256-2fucnb4ZaH4I+FBNJLsUQUz+3rbXoKILpVQVUpYCb2A=";
    };
    # cursor = {
      # package = pkgs.bibata-cursors;
      # name = "Bibata-Modern-Amber";
    # };
    base16Scheme = "${pkgs.base16-schemes}/share/themes/rose-pine.yaml"; # or rose-pine, chalk, da-one-ocean

    targets = {
      plymouth.enable = false;
      kmscon.enable = false;
      # xfce.enable = true;
    };
  };
}
