{
  users.users = {
    kabir = {
      isNormalUser = true;
      description = "Kabir Bakshi";
      group = "wheel";
      extraGroups = [ "wheel" "networkmanager" "input" "uinput" ]; # uinput is for sunshine
    };
    /*
    krishna = {
      isNormalUser = true;
      description = "Krishna Bakshi";
      extraGroups = [ "networkmanager" "wheel" ]; # i2c for baclight control
    };
    */
  };

  security.sudo.extraRules = [
    { 
      users = [ "kabir" /* "krishna" */ ];
      commands = [ 
        {
          command = "/run/current-system/sw/bin/ddcutil";
          options = [ "NOPASSWD" ];
        }
      ]; 
    }
  ];
}
