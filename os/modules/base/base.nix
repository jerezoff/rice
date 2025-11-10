{ ... }: {
  imports = [
    ./boot.nix
    ./certs.nix
    ./gpg.nix
    ./locale.nix
    ./networking.nix
    ./system.nix
    ./theme.nix
    ./users.nix
  ];
}
