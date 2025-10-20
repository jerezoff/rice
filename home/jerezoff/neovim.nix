{ pkgs, ... }: {
  home.packages = with pkgs; [
    sops
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
    rustc
    zig
    cargo
  ];
}
