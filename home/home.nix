{ pkgs, ... }: {
  imports = [ ./neovim.nix ./hyprland/module.nix ];
  home.username = "jerezoff";
  home.homeDirectory = "/home/jerezoff";
  home.stateVersion = "25.05";

  home.packages = with pkgs; [ kubectl k9s git tmux wofi ghostty firefox rnote ];

  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    userEmail = "jerezoff@gmail.com";
    userName = "jerezoff";
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
