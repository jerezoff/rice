{
  description = "My rice home manager";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    quickshell = {
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    catppuccin.url = "github:catppuccin/nix/release-25.05";
    nixvim = {
      url = "github:nix-community/nixvim/nixos-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, quickshell, home-manager, nixvim, catppuccin, ... }:
    let
      system = builtins.currentSystem or "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
      sharedModules = [
            catppuccin.homeModules.catppuccin
            nixvim.homeModules.nixvim
            ./home.nix
            { 
              home.packages = [quickshell.packages.${system}.default ];
              home.file.".config/quickshell" = {
                source = ./hyprland/quickshell;
                recursive = true;
              };
            }
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
