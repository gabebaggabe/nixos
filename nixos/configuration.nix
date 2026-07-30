{
  pkgs,
  config,
  inputs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./modules/all.nix
  ];

  system.stateVersion = "26.05";
}
