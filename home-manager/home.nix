{ config, pkgs, inputs, ... }: 
{
	imports = [
		./home-packages.nix
		./modules
    inputs.spicetify-nix.homeManagerModules.default
	];

	home = {
		username = "ywyh";
		homeDirectory = "/home/ywyh";
		stateVersion = "24.11";
	};
}