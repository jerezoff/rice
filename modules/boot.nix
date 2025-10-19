{ pkgs, ... }: {
  boot.loader = {
    efi = {
      canTouchEfiVariables = false;
      efiSysMountPoint = "/boot/efi";
    };
    grub = {
      efiSupport = true;
      devices = [ "nodev" ];
      enable = true;
      efiInstallAsRemovable = true;
      useOSProber = true;
      extraEntriesBeforeNixOS = false;
      extraEntries = ''
        menuentry "Reboot" {
          reboot
        }

        menuentry "Poweroff" {
          halt
        }
      '';
    };
  };
  boot.kernelPackages = pkgs.linuxPackages_latest;
}
