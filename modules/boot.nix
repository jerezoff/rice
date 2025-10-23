{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [ efibootmgr ];
  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/efi";
    };
    grub = {
      efiSupport = true;
      devices = [ "nodev" ];
      enable = true;
      efiInstallAsRemovable = false;
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
