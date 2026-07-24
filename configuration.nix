{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./modules/nvidia.nix
  ];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  services.displayManager.ly.enable = true;
  services.dunst.enable = true;

  time.timeZone = "America/Toronto";
  i18n.defaultLocale = "en_US.UTF-8";

  services.printing.enable = true;

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  services.libinput.enable = true;

  users.users.gabe = {
    isNormalUser = true;
    extraGroups = ["wheel"];
    packages = [
    ];
  };
 programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    portalPackage = inputs.hyprland.packages.${pkgs.system}.xdg-desktop-portal-hyprland;
  };

  environment.systemPackages = with pkgs; [
    tree
    git
    foot
    efibootmgr
    libnotify
    neovim
    rofi
    thunar
    swaybg
    dunst
    librewolf
    unzip
    clang
    grim
    slurp
    libclang
    fish
    gh
    hyprland
    ripgrep
    spotify
    steam
    wl-clipboard
    waybar
    bibata-cursors
    fastfetch
    clang-tools
    nil
    nixd
    alejandra
    lua-language-server
    stylua
    rust-analyzer
    rustfmt
    vscode-langservers-extracted
    zig
    zls
    go
    gopls
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.iosevka
    noto-fonts
  ];

  users.users.gabe.shell = pkgs.fish;
  nixpkgs.config.allowUnfree = true;

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
    '';
    shellAliases = {
      ff = "fastfetch";
      nrs = "sudo nixos-rebuild switch --flake /etc/nixos";
      svim = "sudo HOME=$HOME nvim";
    };
  };

  systemd.services.autostart = {
    description = "run autostart.sh in mango";
    serviceConfig.ExecStart = "/home/gabe/.config/mango/scripts/autostart.sh";
    wantedBy = ["multi-user.target"];
  };

  security.sudo.extraRules = [
    {
      users = ["gabe"];
      commands = [
        {
          command = "/run/current-system/sw/bin/efibootmgr";
          options = ["NOPASSWD"];
        }
      ];
    }
  ];

  nix.settings.experimental-features = ["nix-command" "flakes"];

  system.stateVersion = "26.05";
}
