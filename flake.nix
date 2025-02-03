{ 
	description = "Main system configurations"; 
	
	inputs = {  
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
		home-manager = {
			url = "github:nix-community/home-manager/master";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		spicetify-nix.url = "github:Gerg-L/spicetify-nix";
		spicetify-nix.inputs.nixpkgs.follows = "nixpkgs";
	};

	outputs = { nixpkgs, home-manager, spicetify-nix, ... }@inputs: let 
		system = "x86_64-linux";
		user = "ywyh";
	in {
		nixosConfigurations.${user} = nixpkgs.lib.nixosSystem {
			inherit system;
			specialArgs = {
        inherit inputs;
      };
			modules = [ ./configuration.nix ];
		};
		
		homeConfigurations.${user} = home-manager.lib.homeManagerConfiguration {
			pkgs = nixpkgs.legacyPackages.${system};
			extraSpecialArgs = {
        inherit inputs;
      };
			modules = [ 
				./home-manager/home.nix
				inputs.spicetify-nix.homeManagerModules.default
			];
		};
	};
}