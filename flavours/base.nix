{ ... }: {
  imports = [
    ../modules/software/archivers.nix
    ../modules/base/base.nix
    ../modules/services/ssh.nix
    ../modules/software/tui.nix
    ../modules/software/git.nix
  ];
  nixpkgs.config.allowUnfree = true;

}
