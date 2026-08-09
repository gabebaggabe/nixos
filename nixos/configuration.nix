{
  pkgs,
  config,
  inputs,
  ...
}: {
  imports = [
    ./modules/games.nix
    ./hardware-configuration.nix
    ./modules/spicetify-nix.nix
    ./modules/nvidia.nix
    ./modules/firewall.nix
    ./modules/filemanager.nix
  ];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  environment.systemPackages = with pkgs; [
    qt6.qt5compat
    kdePackages.qt5compat
    nixd
    nil
    qt6.qt3d
    alejandra
    lua-language-server
    stylua
    vscode-langservers-extracted
    gcc
    bear
    qt6.qtdeclarative
    man-pages
    man-pages-posix
    appimage-run
    qbittorrent
    thunderbird
    strongswan
    discord
    keepassxc
    fuse3
    prismlauncher
    wallust
    matugen
    libnotify
    git
    btop
    foot
    ripgrep
    neovim
    rofi
    file-roller
    dunst
    librewolf
    fish
    spotify
    wl-clipboard
    grim
    slurp
    bibata-cursors
    fastfetch
    tor-browser
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.iosevka
  ];

  services.dunst.enable = true;
  services.printing.enable = true;
  services.libinput.enable = true;
  services.gvfs.enable = true;
  services.tumbler.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  users.users.gabe.shell = pkgs.fish;
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting
    '';
    shellAliases = {
      ff = "fastfetch";
      y = "yazi";
      nrs = "sudo nixos-rebuild switch";
      svim = "sudo HOME=$HOME XDG_RUNTIME_DIR=/run/user/(id -u) WAYLAND_DISPLAY=$WAYLAND_DISPLAY nvim";
    };
  };

  users.users.gabe = {
    isNormalUser = true;
    extraGroups = ["wheel"];
    packages = with pkgs; [
      tree
    ];
  };

  networking.networkmanager.enable = true;

  nix.settings.experimental-features = ["nix-command" "flakes"];
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.pulseaudio = true;

  time.timeZone = "America/Toronto";
  i18n.defaultLocale = "en_US.UTF-8";

  nix.gc = {
    automatic = true;
    dates = "daily";
    options = "--delete-older-than 14d";
  };
  nix.settings.auto-optimise-store = true;
  system.autoUpgrade = {
    enable = true;
    dates = "weekly";
  };

  hardware.bluetooth.enable = true;
  networking.hostName = "nixos";
  security.rtkit.enable = true;

  documentation.man.enable = true;

  system.stateVersion = "26.11";
}
