{ ... }: {

  services.openssh.enable = true;

  services.flatpak.enable = true;

  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.displayManager.defaultSession = "hyprland";
  services.udisks2.enable = true;
  services.gvfs.enable = true;
}
