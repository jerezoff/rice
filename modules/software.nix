{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;

  programs.zsh.enable = true;
  xdg.portal = {
    enable = true;
    extraPortals =
      [ pkgs.xdg-desktop-portal-gtk pkgs.xdg-desktop-portal-hyprland ];
  };
  programs.hyprland.enable = true;
  programs.gnupg.agent = {
    enable = true;
    pinentryPackage = pkgs.pinentry-curses;
    enableSSHSupport = true;
  };

  environment.systemPackages = with pkgs; [
    vial
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
