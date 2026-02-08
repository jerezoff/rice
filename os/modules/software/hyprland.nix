{ pkgs, ... }: {
  imports = [ ./thunar.nix ];
  xdg.portal = {
    enable = true;
    config = {
      common.default = "*";
      hyprland = { default = [ "hyprland" "gtk" ]; };
    };
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };
  programs.hyprland.enable = true;
  environment.sessionVariables = { NIXOS_OZONE_WL = "1"; };

  environment.systemPackages = with pkgs; [
    usbutils
    kdePackages.xdg-desktop-portal-kde
  ];
}
