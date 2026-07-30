{
  pkgs,
  inputs,
  ...
}: {
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
  environment.systemPackages = with pkgs; [
    git
    waypaper
    btop
    foot
    ripgrep
    neovim
    rofi
    file-roller
    swaybg
    dunst
    librewolf
    unzip
    fish
    spotify
    wl-clipboard
    grim
    slurp
    bibata-cursors
    fastfetch
    tor-browser
  ];
}
