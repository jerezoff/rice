{ pkgs, ... }: {
  config.services.postgresql = {
    package = pkgs.postgresql_17_jit;
    enable = true;
    ensureDatabases = [ "default" ];
    port = 5432;
    authentication = pkgs.lib.mkOverride 10 ''
      #...
      #type database DBuser origin-address auth-method
      local all       all     trust
      # ipv4
      host  all      all     127.0.0.1/32   trust
      # ipv6
      host all       all     ::1/128        trust
    '';
  };

  environment.systemPackages = with pkgs; [ postgresql17Packages.postgis ];
}
