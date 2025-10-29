{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;

  programs.zsh.enable = true;
  xdg.portal = {
    enable = true;
    config = {
      common.default = "*";
      hyprland = { default = [ "hyprland" "gtk" ]; };
    };
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };
  programs.dconf.enable = true;
  programs.hyprland.enable = true;
  programs.gnupg.agent = {
    enable = true;
    pinentryPackage = pkgs.pinentry-curses;
    enableSSHSupport = true;
  };

  programs.thunar.enable = true;
  programs.xfconf.enable = true;
  programs.thunar.plugins = with pkgs.xfce; [
    thunar-archive-plugin
    thunar-volman
  ];

  environment.sessionVariables = { NIXOS_OZONE_WL = "1"; };

  environment.systemPackages = with pkgs; [

    helvum
    usbutils
    btop
    tmux
    vlc
    mpv
    git
    neovim
    firefox
    xdg-desktop-portal
    xdg-desktop-portal-hyprland
    xdg-desktop-portal-gtk
  ];
}
