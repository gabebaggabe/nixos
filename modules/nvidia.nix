{ config, lib, pkgs, ... }:
{
  #  [CPU & GPU | AMD Ryzen 7 5800x. nvidia 1660Ti]

  # Enable OpenGL
  hardware.graphics = {
    enable = true;
  };

  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = true;
    powerManagement.finegrained = false;
    open = true;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;

    prime = {
      nvidiaBusId = "PCI:14:0:0";
      amdgpuBusId = "PCI:54:0:0";

      offload = {
        enable = true;
        enableOffloadCmd = true;
      };
    };
  };
}
