{pkgs, ...}: {
  imports = [
    ./modules/games.nix
    ./hardware-configuration.nix
    ./modules/spicetify-nix.nix
    ./modules/nvidia.nix
    ./modules/filemanager.nix
    ./modules/coding.nix
    ./modules/emulators.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  programs.nix-ld.enable = true;

  services.usbmuxd.enable = true;

  environment.systemPackages = with pkgs; [
    umu-launcher
    appimage-run
    qbittorrent
    playerctl
    unclutter
    thunderbird
    strongswan
    discord
    cpu-x
    keepassxc
    fuse3
    libnotify
    git
    btop
    foot
    ripgrep
    rofi
    file-roller
    dunst
    librewolf
    fish
    spotify
    bibata-cursors
    fastfetch
    tor-browser
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.iosevka
  ];

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

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
      svim = "sudo env HOME=$HOME XDG_RUNTIME_DIR=/run/user/(id -u) WAYLAND_DISPLAY=$WAYLAND_DISPLAY nvim";
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

  networking.hostName = "nixos";
  security.polkit.enable = true;
  security.rtkit.enable = true;

  documentation.man.enable = true;

  system.stateVersion = "26.11";
}
