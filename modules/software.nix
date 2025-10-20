{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;

  programs.zsh.enable = true;
  xdg.portal = {
    enable = true;
    extraPortals =
      [ pkgs.xdg-desktop-portal-gtk pkgs.xdg-desktop-portal-hyprland ];
  };
  programs.dconf.enable = true;
  programs.hyprland.enable = true;
  programs.gnupg.agent = {
    enable = true;
    pinentryPackage = pkgs.pinentry-curses;
    enableSSHSupport = true;
  };

  environment.systemPackages = with pkgs; [
    helvum
    vial
    usbutils
    btop
    tmux
    git
    neovim
    firefox
    xdg-desktop-portal
    xdg-desktop-portal-hyprland
    xdg-desktop-portal-gtk
  ];
}
