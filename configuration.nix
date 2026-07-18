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
    inputs.mangowm.nixosModules.mango
  ];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  services.displayManager.ly.enable = true;

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
    packages = with pkgs; [
      tree
      git
      foot
      neovim
      rofi
      thunar
      swaybg
      librewolf
    ];
  };

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
  programs.mango.enable = true;

  environment.systemPackages = with pkgs; [
    vim
    unzip
    clang
    libclang
    fish
    hyprland
    ripgrep
    spotify
    steam
    ani-cli
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
    vs-code-langservers-extracted
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
  hardware.graphics.enable = true;
  hardware.nvidia.modesetting.enable = true;
  hardware.nvidia.open = true;
  services.xserver.videoDrivers = ["nvidia"];

  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "nvidia";
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    WLR_NO_HARDWARE_CURSORS = "1";
  };

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
    '';
  };

  nix.settings.experimental-features = ["nix-command" "flakes"];

  system.stateVersion = "26.05";
}
