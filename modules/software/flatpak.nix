{
  # Enable Flatpak
  services.flatpak.enable = true;

  services.flatpak.packages = [
    "org.telegram.desktop"

    "com.heroicgameslauncher.hgl"

    /* { # elyprismlauncher
      flatpakref = "https://elyprismlauncher.github.io/flatpak/elyprismlauncher.flatpakref";
      sha256="b7c919c031d048cc01e2378909aa030e4737417008c5ab0ea29cab098b50b477";
    } */

    "org.jdownloader.JDownloader"

    # "dev.lizardbyte.app.Sunshine"

  ];
}
