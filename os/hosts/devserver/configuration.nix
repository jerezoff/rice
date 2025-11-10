{ ... }: {
  networking.hostName = "devserver";
  nix.settings.trusted-users = [ "jerezoff" "root" ];
}
