{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./audio.nix
    ./coding.nix
    ./games.nix
    ./garbage.nix
    ./nvidia.nix
    ./packages.nix
    ./random.nix
    ./shell.nix
    ./thunar.nix
    ./user.nix
  ];
}
