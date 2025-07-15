{ 
	description = "Main system configurations"; 
	
	inputs = {  
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  	nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.05";

		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		spicetify-nix = {
			url = "github:Gerg-L/spicetify-nix";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		zen-browser = {
			url = "github:0xc000022070/zen-browser-flake";
			# IMPORTANT: we're using "libgbm" and is only available in unstable so ensure
			# to have it up-to-date or simply don't specify the nixpkgs input  
			inputs.nixpkgs.follows = "nixpkgs";
		};

		nixcord = {
			url = "github:kaylorben/nixcord";
		};
	};

	outputs = { nixpkgs, home-manager, ... }@inputs: let 
		system = "x86_64-linux";
		user = "ywyh";
		home = "home";
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
				inherit home;
				inherit stateVersion;
				inherit uwsm;
				stablePkgs = inputs.nixpkgs-stable.legacyPackages.${system};
			};
			modules = [ 
				./home-manager/home.nix
				inputs.nixcord.homeModules.nixcord
        inputs.spicetify-nix.homeManagerModules.default
				inputs.zen-browser.homeModules.default
			];
		};
	};
}
