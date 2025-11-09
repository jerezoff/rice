{
  description = "Jerezoffs hosts config";
  inputs = {
    nixvim = {
      url = "github:nix-community/nixvim/nixos-25.05";
      # If you are not running an unstable channel of nixpkgs, select the corresponding branch of Nixvim.
      # url = "github:nix-community/nixvim/nixos-25.05";

      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    catppuccin.url = "github:catppuccin/nix";
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, home-manager, catppuccin, nixvim, ... }:
    let
      system = "x86_64-linux";
      global_modules =
        [ catppuccin.nixosModules.catppuccin ./flavours/base.nix nixvim.nixosModules.nixvim ];
    in
    {
      nixosConfigurations.heavycruiser = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = global_modules ++ [
          ./hosts/heavycruiser/configuration.nix
          ./hosts/heavycruiser/hardware-configuration.nix
          ./flavours/gaming.nix
          ./flavours/desktop.nix
          ./flavours/media.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.jerezoff = {
              imports = [ ./home/jerezoff/hosts/heavycruiser.nix ];
            };
            home-manager.extraSpecialArgs = {
              inherit nixvim;
            };
          }
        ];
      };
      nixosConfigurations.acefighter = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = global_modules ++ [
          ./hosts/acefighter/configuration.nix
          ./hosts/acefighter/hardware-configuration.nix
          ./flavours/desktop.nix
          ./flavours/media.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.jerezoff = {
              imports = [ ./home/jerezoff/hosts/heavycruiser.nix ];
            };
          }
        ];
      };

      nixosConfigurations.devserver = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = global_modules ++ [
          ./hosts/devserver/configuration.nix
          ./hosts/devserver/hardware-configuration.nix
          ./modules/server/docker.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.jerezoff = {
              imports = [ ./home/jerezoff/hosts/devserver.nix ];
            };
          }
        ];
      };
    };
}
