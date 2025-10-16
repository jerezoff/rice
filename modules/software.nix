{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;

  programs.zsh.enable = true;
  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gnome
      pkgs.xdg-desktop-portal-wlr
      pkgs.xdg-desktop-portal-hyprland
    ];
  };
  programs.hyprland.enable = true;

  environment.systemPackages = with pkgs; [
    usbutils
    git
    neovim
    firefox
    wofi
    ghostty
    qbittorrent
    kdePackages.dolphin
  ];
}
