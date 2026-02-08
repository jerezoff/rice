{ pkgs, ... }: {
  imports = [ ./neovim.nix ./hyprland/module.nix ];
  home.username = "jerezoff";
  home.homeDirectory = "/home/jerezoff";
  home.stateVersion = "25.11";

  home.packages = with pkgs; [ git tmux ghostty ];

  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    settings = {
    user = {
      email = "jerezoff@gmail.com";
      name = "jerezoff";
    };
    };
  };

  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = [ "docker" "rust" "node" "ssh" "ssh-agent" "tmux" "kubectl" ];
      theme = "agnoster";
    };
  };
}
