{ pkgs, ... }: {
  networking.firewall.allowedTCPPorts = [
    6443
  ];
  networking.firewall.allowedUDPPorts = [

  ];

  services.k3s.enable = true;
  services.k3s.role = "server";
  services.k3s.extraFlags = toString [
  ];
}
