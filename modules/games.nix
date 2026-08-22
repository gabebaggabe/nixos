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
    prismlauncher
  ];
  environment.sessionVariables = {
    MESA_SHADER_CACHE_MAX_SIZE = "10G";
    VK_DISABLE_SHADER_DISK_CACHE = "1";
    DISABLE_VK_LAYER_VALVE_steam_fossilize_1 = "1";
  };
  programs.steam = {
    enable = true;
  };
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
}
