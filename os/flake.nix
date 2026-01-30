{
  description = "Jerezoffs hosts config";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    catppuccin.url = "github:catppuccin/nix";
    home-manager.url = "github:nix-community/home-manager/release-25.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, catppuccin, ... }:
    let
      system = "x86_64-linux";
      global_modules =
        [ ./flavours/base.nix ];
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
        ];
      };
      nixosConfigurations.acefighter = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = global_modules ++ [
          ./hosts/acefighter/configuration.nix
          ./hosts/acefighter/hardware-configuration.nix
          ./flavours/desktop.nix
        ];
      };

      nixosConfigurations.devserver = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = global_modules ++ [
          ./hosts/devserver/configuration.nix
          ./hosts/devserver/hardware-configuration.nix
          ./modules/server/docker.nix
        ];
      };
    };
}
