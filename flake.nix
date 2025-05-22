{ 
	description = "Main system configurations"; 
	
	inputs = {  
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		spicetify-nix.url = "github:Gerg-L/spicetify-nix";
		spicetify-nix.inputs.nixpkgs.follows = "nixpkgs";

		zen-browser.url = "github:0xc000022070/zen-browser-flake";
	};

	outputs = { nixpkgs, home-manager, spicetify-nix, ... }@inputs: let 
		system = "x86_64-linux";
		user = "ywyh";
		stateVersion = "24.11";
		uwsm = true; # Whether to use uwsm or no
	in {
		nixosConfigurations.${user} = nixpkgs.lib.nixosSystem {
			inherit system;
			specialArgs = {
				inherit inputs;
				inherit user;
				inherit stateVersion;
				inherit uwsm;
			};
			modules = [ ./configuration.nix ];
		};
		
		homeConfigurations.${user} = home-manager.lib.homeManagerConfiguration {
			pkgs = nixpkgs.legacyPackages.${system};
			extraSpecialArgs = {
				inherit inputs;
				inherit system;
				inherit user;
				inherit stateVersion;
				inherit uwsm;
			};
			modules = [ 
				./home-manager/home.nix
				inputs.spicetify-nix.homeManagerModules.default
			];
		};
	};
}
