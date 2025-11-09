{ ... }: {

  catppuccin = {
    sddm = {
      accent = "rosewater";
      flavor = "mocha";
      assertQt6Sddm = true;
      enable = true;
    };

    tty = {
      enable = true;
      flavor = "mocha";
    };

    grub = {
      enable = true;
      flavor = "mocha";
    };
  };
}
