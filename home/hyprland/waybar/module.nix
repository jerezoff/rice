{ ... }: {
  catppuccin.waybar = {
    enable = true;
    flavor = "mocha";
  };

  programs.waybar = { 
    enable = true; 
    systemd.enable = true;
  };
}
