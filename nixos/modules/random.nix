{pkgs, ...}: {
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  services.dunst.enable = true;
  services.displayManager.ly.enable = true;
  services.printing.enable = true;
  services.libinput.enable = true;
}
