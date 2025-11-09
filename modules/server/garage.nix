{ ... }: {
  services.garage.enable = true;

  networking.firewall.allowedTCPPorts = [ 8080 9090 ];
}
