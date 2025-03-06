{ config, pkgs, user, stateVersion, ... }: 
{
	imports = [
		./home-packages.nix
		./modules
	];

	home = {
		username = user;
		homeDirectory = "/home/ywyh";
		stateVersion = stateVersion;
	};
}
