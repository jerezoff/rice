{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [ p7zip zip unzip rar ];
}
