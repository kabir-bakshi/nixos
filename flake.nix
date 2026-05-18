{
  description = "Flake for locking package versions for Kabir";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    stylix.url = "github:nix-community/stylix";
  };

  outputs = { nixpkgs, nix-flatpak, home-manager, ... } @ inputs: {

    nixosConfigurations = {
      m720q = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        specialArgs = { inherit inputs; };
        
        modules = [
          ./modules # will import default modules

          ./configuration.nix
          
          nix-flatpak.nixosModules.nix-flatpak
          
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              backupFileExtension = "nix_backup";
              
              users.kabir = ./kabir_home.nix;
              # users.krishna = ./krishna_home.nix;
            };
          }

          inputs.stylix.nixosModules.stylix
        ];
      };
    };
  };
}
