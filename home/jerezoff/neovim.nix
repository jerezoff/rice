{ nixvim, pkgs, ... }:
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
    dependencies.imagemagick.enable = true;

    keymaps = [
      {
        key = ";";
        action = ":";
      }
      {
        key = "<leader><Space>";
        action = "<cmd>Telescope find_files<CR>";
        mode = "n";
      }
      {
        key = "<leader>qq";
        action = "<cmd>q<CR>";
        mode = "n";
      }
      {
        key = "<S-h>";
        action = "<cmd>BufferPrevious<CR>";
        mode = "n";
      }
      {
        key = "<S-l>";
        action = "<cmd>BufferNext<CR>";
        mode = "n";
      }
      {
        key = "gg";
        action = "<cmd>LazyGit<CR>";
        mode = "n";
      }
    ];

    lsp.servers = {
      docker_language_server.enable = true;
      nginx_language_server.enable = true;
      ts_ls.enable = true;
      nil_ls.enable = true;
    };

    plugins = {
      conform-nvim.enable = true;
      vim-be-good.enable = true;
      barbar.enable = true;
      image.enable = true;
      harpoon = {
        enableTelescope = true;
        enable = true;
      };
      which-key = {
      	enable = true;
        settings = {
          preset = "modern";
          show_help = true;
          timeout = 300;
        };
      };
      web-devicons.enable = true;
      lualine.enable = true;
      treesitter.enable = true;
      neo-tree.enable = true;
      lspconfig.enable = true;
      blink-cmp.enable = true;
      telescope.enable = true;
      lazygit.enable = true;
      dashboard.enable = true;
      none-ls = {
        enable = true;
        sources.formatting = {
          prettier.enable = true;
          nixfmt.enable = true;
        };
      };
      nix.enable = true;
    };

    opts = {
      number = true;         
      relativenumber = true; 
      tabstop = 2;           
      shiftwidth = 2;        
      expandtab = true;      
    };

    colorschemes.gruvbox.enable = true;

  };
}
