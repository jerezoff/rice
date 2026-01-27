{ pkgs, lib, ... }: {

  environment.systemPackages = with pkgs; [
    impala
    dnsmasq
    kdePackages.bluedevil
    bluez-qt
    pkgs.openobex
    pkgs.obexftp
  ];

  services.blueman.enable = true;

  networking = {
    useDHCP = true;
    useNetworkd = true;
    hostName = lib.mkDefault "miraios";
    wireless = {
      iwd = {
        enable = true;
        settings = {
          IPv6 = {
            enabled = true;
          };
          Settings = {
            AutoConnect = true;
          };
        };
      };
    };
  };

  services.resolved.enable = false;

  services.dnsmasq = {
    enable = true;
    resolveLocalQueries = true;  # Allow resolving from /etc/hosts and local networks
    alwaysKeepRunning = true;    # Keep running even if no DHCP clients
    settings = {
      # Upstream DNS servers to forward queries to
      server = [
        "8.8.8.8"          # Google DNS primary
        "8.8.4.4"          # Google DNS secondary
        "1.1.1.1"          # Cloudflare DNS (optional, for redundancy)
      ];
      # Cache settings
      cache-size = 1000;         # Number of DNS entries to cache (default: 150)
      # Optional: Additional cache tweaks
      min-cache-ttl = 3600;      # Minimum TTL for cached entries (1 hour)
      max-cache-ttl = 86400;     # Maximum TTL (1 day)
      # Basic security/optimizations (recommended for a cache)
      domain-needed = true;      # Don't forward short names
      bogus-priv = true;         # Never forward addresses in private ranges
      localise-queries = true;   # Answer authoritative queries from /etc/hosts
    };
  };
  # Point the system to use localhost as the DNS resolver (so it uses the cache)
  networking.nameservers = [ "127.0.0.1" ];

  # Optional: Open firewall for DNS (UDP/TCP port 53) if needed for remote clients
  networking.firewall.allowedTCPPorts = [ 53 53317 ];
  networking.firewall.allowedUDPPorts = [ 53 ];
}
