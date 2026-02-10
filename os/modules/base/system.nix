{ ... }: {
  system.stateVersion = "25.11"; 
  boot.kernel.sysctl = {
    "net.ipv4.ip_forward" = 1;
    "net.ipv6.conf.all.forwarding" = 1;
  };
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
