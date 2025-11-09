{ ... }: {
  services.redis.servers."default" = {
    enable = true;
    user = "miraios";
  };
}
