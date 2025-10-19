{ ... }: {
  imports = [ ../home.nix ];
  wayland.windowManager.hyprland.settings = {
    monitor = [
      "DP-3, 3440x1440@144, 0x0, 1"
      "HDMI-A-1, 1920x1080@100, -1920x0, 1"
      ", preferred, auto, auto"
    ];
  };
}
