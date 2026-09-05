{pkgs, ...}: {
  programs.gamemode.enable = true;
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };
  environment.systemPackages = with pkgs; [
    heroic
    lutris
    mumble
    wine
    wine-wayland
    prismlauncher
    protonup-qt
  ];
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
  environment.sessionVariables = {
    MESA_SHADER_CACHE_MAX_SIZE = "10G";
    VK_DISABLE_SHADER_DISK_CACHE = "1";
    DISABLE_VK_LAYER_VALVE_steam_fossilize_1 = "1";
  };
}
