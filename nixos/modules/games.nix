{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    wine
    wine-wayland
    steam
    lutris
    pcsx2
    rpcs3
    shadps4
    ppsspp
    dolphin-emu
    flycast
    retroarch
    melonds
    mangohud
    protonup-qt
  ];
  programs.steam = {
    enable = true;
  };
}
