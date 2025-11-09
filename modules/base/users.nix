{ pkgs, ... }: {

  users.users.jerezoff = {
    isNormalUser = true;
    description = "jerezoff";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
  };
}
