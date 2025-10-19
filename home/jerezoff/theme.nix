{ pkgs, ... }: {

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      gtk-theme = "Catppuccin-Mocha";
    };
  };

  gtk = {
    enable = true;
    theme = {
      name = "Catppuccin-Mocha";
      package = pkgs.gnome-themes-extra;
    };
    gtk3.extraConfig = { gtk-application-prefer-dark-theme = true; };
    gtk4.extraConfig = { gtk-application-prefer-dark-theme = true; };
  };

  qt = {
    enable = true;
    platformTheme = "gnome";
    style = {
      name = "Catppuccin-Mocha";
      package = pkgs.libsForQt5.qt5ct;
    };
  };

  wayland.windowManager.hyprland = {
    settings.env =
      [ "GTK_THEME,Catppuccin-Mocha" "QT_QPA_PLATFORMTHEME,qt6ct" ];
  };
}
