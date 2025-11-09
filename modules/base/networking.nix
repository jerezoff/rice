{ lib, ... }: {
  networking.hostName = lib.mkDefault "miraios";
  networking.networkmanager.enable = true;
}
