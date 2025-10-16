{ pkgs, ... }: {
  home.packages = with pkgs; [
    neovim
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
    cargo
    rustc
  ];
}
