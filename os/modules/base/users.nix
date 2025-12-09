{ pkgs, ... }: {

  users.users.jerezoff = {
    isNormalUser = true;
    description = "jerezoff";
    extraGroups = [ "wheel" "docker" ];
    shell = pkgs.zsh;
  };
}
