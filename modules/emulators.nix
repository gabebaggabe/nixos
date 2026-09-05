{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    scummvm
    dosbox
    pcsx2
    rpcs3
    ppsspp
    dolphin-emu
    flycast
    melonds
  ];
}
