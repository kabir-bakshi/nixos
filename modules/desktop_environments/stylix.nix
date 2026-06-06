{ pkgs, ... }:
{
  stylix = {
    enable = true;
    polarity = "dark";
    # image = ./../../Media/Wallpapers/Padmanabhaswami.png;
    image = pkgs.fetchurl {
      url = "https://res.cloudinary.com/dmq0bize2/image/upload/v1780229904/wallhaven-k828w6_lvxqzn.jpg"; 
      hash = "sha256-VHcdwryVnj0+OUXmrzB/OAqXkGz3rqUey1VZGKdzJh0=";
    };
    # cursor = {
      # package = pkgs.bibata-cursors;
      # name = "Bibata-Modern-Amber";
    # };
    base16Scheme = "${pkgs.base16-schemes}/share/themes/rose-pine.yaml"; # or rose-pine, chalk, da-one-ocean

    targets = {
      plymouth.enable = false;
      kmscon.enable = false;
   };

  };
}
