{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    steam
    prismlauncher
    #emulators
    # psx duckstation not avaliable on nixpkgs use app img
    appimage-run
    pcsx2
    rpcs3
    shadps4
    ppsspp
    dolphin-emu
    flycast
    retroarch
    melonds
  ];
  programs = {
    steam.enable = true;
  };
}
