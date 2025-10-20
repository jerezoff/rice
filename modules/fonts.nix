{ pkgs, ... }: {
  fonts.packages = with pkgs; [
    fira-code
    fira-code-symbols
    font-awesome
    liberation_ttf
    mplus-outline-fonts.githubRelease
    noto-fonts
    noto-fonts-emoji
    proggyfonts
    nerd-fonts.droid-sans-mono
  ];
}
