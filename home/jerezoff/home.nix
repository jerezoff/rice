{ pkgs, ... }: {
  imports = [ ./neovim.nix ./hyprland.nix ];
  home.username = "jerezoff";
  home.homeDirectory = "/home/jerezoff";
  home.stateVersion = "25.05";

  home.packages = with pkgs; [
    neovim
    git
    pavucontrol
    networkmanagerapplet
    waybar
    gnome-software
    tmux
    kitty
    ghostty
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
