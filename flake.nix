{
  description = "Jerezoffs hosts config";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    catppuccin.url = "github:catppuccin/nix";
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, home-manager, catppuccin, ... }:
    let
      system = "x86_64-linux";
      global_modules =
        [ catppuccin.nixosModules.catppuccin ./flavours/base.nix ];
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
          ./modules/server/garage.nix
          ./modules/server/postgres.nix
          ./modules/server/redis.nix
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
