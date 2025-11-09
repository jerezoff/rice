{ nixvim, lib, pkgs, ... }:
{
  imports = [
    nixvim.homeModules.nixvim
  ];
  home.packages = with pkgs; [
    sops
    python3
    lua
    fzf
    luajitPackages.luarocks
    sqlite
    ripgrep
    lazygit
    ghostscript
    tectonic
    mermaid-cli
    fd
    imagemagick
    tree-sitter
    gcc
    nodejs
    rustc
    zig
    cargo
  ];

  programs.nixvim = {
    viAlias = true;
    vimAlias = true;
    enable = true;
    defaultEditor = true;

    globals.mapleader = " ";

    plugins = {
      web-devicons.enable = true;
      lualine.enable = true;
      treesitter.enable = true;
      neo-tree.enable = true;
      lspconfig.enable = true;
      blink-cmp.enable = true;
      telescope.enable = true;
      lazygit.enable = true;
      dashboard.enable = true;
    };

    colorschemes.gruvbox.enable = true;

  };
}
