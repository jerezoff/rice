{
  description = "My rice home manager";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim/nixos-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, nixvim, ... }:
    let
      system = builtins.currentSystem or "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
      sharedModules = [
            nixvim.homeModules.nixvim
            ./home.nix
      ];
    in
    {
      homeConfigurations = {
        jerezoff = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = sharedModules;
        };

        heavycruiser = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = sharedModules ++ [./hosts/heavycruiser.nix];
        };
      };
    };
}
