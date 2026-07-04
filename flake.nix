{
  description = "Flake for locking package versions for Kabir";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    
    /*
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };
    import-tree.url = "github:vic/import-tree";

    wrapper-modules.url = "github:BirdeeHub/nix-wrapper-modules";
    */

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";

    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    helium-flake = {
      url = "github:oxcl/nix-flake-helium-browser";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    # affinity-nix.url = "github:mrshmllow/affinity-nix";
  };

  outputs = inputs: {
    # inputs.flake-parts.lib.mkFlake { inherit inputs; } ( inputs.import-tree ./modules ); # will import all modules recursively.
    nixosConfigurations = {
      m720q = inputs.nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        specialArgs = { inherit inputs; };
        
        modules = [
          ./modules # will import default modules

          ./hosts/m720q/configuration.nix
          
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

          inputs.agenix.nixosModules.default
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
