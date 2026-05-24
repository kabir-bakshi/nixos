{ self, inputs } : {
  flake.nixosConfigurations.m720q = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.defaultModules # will import default modules
      
      ./configuration.nix
          
      inputs.nix-flatpak.nixosModules.nix-flatpak
          
      inputs.home-manager.nixosModules.home-manager {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          backupFileExtension = "nix_backup";
              
          users.kabir = ./user_modules/kabir/home.nix;
          # users.krishna = ./user_modules/krishna/home.nix;
        };
      }

      inputs.stylix.nixosModules.stylix
    ];
  };
}
