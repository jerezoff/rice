{...}: {
  services = {
    desktopManager.plasma6.enable = true;
    desktopManager.sddm.enable = true;
    desktopManager.sddm.wayland.enable = true;
  };
}
