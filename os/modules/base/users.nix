{ pkgs, ... }: {

  users.users.jerezoff = {
    isNormalUser = true;
    description = "jerezoff";
    extraGroups = [ "wheel" "docker" "i2c" ];
    shell = pkgs.zsh;
  };
}
