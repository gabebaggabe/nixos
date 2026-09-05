{
  description = "gabes flake";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    hyprland.url = "github:hyprwm/hyprland/v0.56.0";
    awww.url = "git+https://codeberg.org/lgfae/awww?ref=refs/tags/v0.12.1";
    quickshell.url = "github:outfoxxed/quickshell/v0.3.0";
    matugen.url = "github:Iniox/Matugen";
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
  };
  outputs = inputs @ {
    self,
    nixpkgs,
    hyprland,
    awww,
    quickshell,
    spicetify-nix,
    ...
  }: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {inherit inputs;};
      modules = [
        inputs.matugen.nixosModules.default
        inputs.spicetify-nix.nixosModules.spicetify
        ./configuration.nix
        ({pkgs, ...}: {
          programs.hyprland = {
            enable = true;
            package = hyprland.packages.${pkgs.system}.hyprland;
            portalPackage = hyprland.packages.${pkgs.system}.xdg-desktop-portal-hyprland;
          };

          environment.systemPackages = [
            quickshell.packages.${pkgs.system}.default
            awww.packages.${pkgs.stdenv.hostPlatform.system}.awww
            pkgs.fd
          ];
        })
      ];
    };
  };
}
