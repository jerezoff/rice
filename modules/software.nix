{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;

  programs.zsh.enable = true;
  xdg.portal = {
    enable = true;
    extraPortals =
      [ pkgs.xdg-desktop-portal-gtk pkgs.xdg-desktop-portal-hyprland ];
  };
  programs.hyprland.enable = true;

  environment.systemPackages = with pkgs; [
    usbutils
    btop
    tmux
    git
    neovim
    firefox
    wofi
    ghostty
    qbittorrent
    kdePackages.dolphin
    xdg-desktop-portal
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland
  ];
}
