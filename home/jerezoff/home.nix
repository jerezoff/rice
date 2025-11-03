{ pkgs, ... }: {
  imports = [ ./neovim.nix ];
  home.username = "jerezoff";
  home.homeDirectory = "/home/jerezoff";
  home.stateVersion = "25.05";

  home.packages = with pkgs; [
    kubectl
    k9s
    fluxcd
    age
    git
    gnome-software
    tmux
    ghostty
    wofi
    qbittorrent
    vial
  ];

  programs.git = {
    enable = true;
    userEmail = "jerezoff@gmail.com";
    userName = "jerezoff";
  };

  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = [ ];
      theme = "agnoster";
    };
  };
}
