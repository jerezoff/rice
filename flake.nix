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
      global_modules = [
        ./modules/boot.nix
        ./modules/networking.nix
        ./modules/services.nix
        ./modules/software.nix
        ./modules/users.nix
        ./modules/locale.nix
        ./modules/system.nix
        ./modules/archivers.nix
        ./modules/theme.nix
        ./modules/fonts.nix
        ./modules/certs.nix
        catppuccin.nixosModules.catppuccin
      ];
    in
    {
      nixosConfigurations.heavycruiser = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = global_modules ++ [
          ./hosts/heavycruiser/configuration.nix
          ./hosts/heavycruiser/hardware-configuration.nix
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
          ./modules/gaming/minecraft.nix
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
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.jerezoff = {
              imports = [ ./home/jerezoff/hosts/hackersmainframe.nix ];
            };
          }
        ];
      };
    };
}
