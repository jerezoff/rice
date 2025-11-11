{ ... }:
let
  hostname = builtins.readFile "/etc/hostname";

  # Define host-specific Hyprland monitor settings
  hostMonitors = {
    "heavycruiser" = [
      "DP-3, 3440x1440@144, 0x0, 1"
      "HDMI-A-1, 1920x1080@100, 760x1440, 1"
      ", preferred, auto, auto"
    ];
  };

  monitorConfig = hostMonitors.${hostname} or ''
    ,preferred,auto,1 #${hostname}
  '';
in
{
  wayland.windowManager.hyprland.settings.monitor = monitorConfig;
}
