{ ... }: {

  services.openssh.enable = true;

  services.flatpak.enable = true;

  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.displayManager.defaultSession = "hyprland";
  services.udisks2.enable = true;
  services.gvfs.enable = true;

  services.pipewire = {
    enable = true;
    audio.enable = true;
    pulse.enable = true; # заменяет PulseAudio
    jack.enable = true; # опционально
    alsa.enable = true;
  };
  security.rtkit.enable = true;
  sound.enable = true;

  hardware.pulseaudio.enable = false;
}
