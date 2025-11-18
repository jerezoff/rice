{ pkgs, ... }: {

  services.flatpak.enable = true;

  services.xserver.enable = true;
  services.dbus.enable = true;
  services.displayManager.sddm = {
    enable = true;
    package = pkgs.kdePackages.sddm;
  };
  services.displayManager.defaultSession = "hyprland";
  services.udisks2.enable = true;
  services.gvfs.enable = true;
  services.tumbler.enable = true;
  services.upower.enable = true;

  hardware.keyboard.qmk.enable = true;

  environment.systemPackages = with pkgs; [
    via
    vial
  ];

  services.udev = {
    packages = with pkgs; [ qmk qmk-udev-rules qmk_hid via vial ];
  };

  services.pipewire = {
    enable = true;
    audio.enable = true;
    pulse.enable = true; # заменяет PulseAudio
    jack.enable = true; # опционально
    alsa.enable = true;
  };
  security.rtkit.enable = true;
}
