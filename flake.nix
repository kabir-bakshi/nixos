{
  description = "Flake for locking package versions.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";

    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    dank-greeter = {
      url = "github:duxlabs-dev/dux-greeter";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    dux-files = {
      url = "github:duxlabs-dev/dux-files";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs: {
    nixosConfigurations = {
      m720q = inputs.nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        
        modules = [
          ./modules # will import default modules
          ./hosts/m720q/configuration.nix
          
          inputs.nix-flatpak.nixosModules.nix-flatpak
          inputs.dank-greeter.nixosModules.default
          
          inputs.home-manager.nixosModules.home-manager {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              backupFileExtension = "nix_backup";
              
              users.kabir = ./user_modules/kabir/home.nix;
            };
          }

          inputs.stylix.nixosModules.stylix
        ];
      };

      latitude-5511 = inputs.nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };

        modules = [
	  ./modules
          ./hosts/latitude-5511/configuration.nix
          
          inputs.nix-flatpak.nixosModules.nix-flatpak
          inputs.dank-greeter.nixosModules.default

	  inputs.home-manager.nixosModules.home-manager {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              backupFileExtension = "nix_backup";
              
              users.kabir = ./user_modules/kabir/home.nix;
            };
          }

          inputs.stylix.nixosModules.stylix
        ];
      };

      m60e = inputs.nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };

        modules = [
          ./modules
          ./hosts/m60e/configuration.nix

          inputs.stylix.nixosModules.stylix
        ];
      };
    };
  };
}
