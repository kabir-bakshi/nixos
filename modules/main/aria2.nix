{ config, pkgs, ... }: {
  age.secrets.aria2 = {
    file = ./secrets/aria2.age;
    owner = "kabir";
    group = "aria2";
  };

  services.aria2 = {
    enable = true;
    rpcSecretFile = config.age.secrets.aria2.path;
  };
  
  users.users.kabir.extraGroups = [ "aria2" ];

  services.caddy = {
    enable = true;
    # virtualHosts."http://aria2.local" = { # Will host the AriaNG software website on system startup
    virtualHosts."localhost" = { # Will host the AriaNG software website on system startup
      extraConfig = ''
        reverse_proxy /jsonrpc localhost:${toString config.services.aria2.settings.rpc-listen-port}
        file_server {
          root ${pkgs.ariang}/share/ariang
        }
      '';
    };
  };
}
