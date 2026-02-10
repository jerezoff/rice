{ ... }: {
  networking.hostName = "acefighter";
  imports = [
    ../../modules/server/k3s.nix
  ];
}
