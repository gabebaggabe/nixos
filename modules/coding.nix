{pkgs, ...}: {
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
    strongswan
    fuse3
    neovim
    wl-clipboard
    grim
    libnotify
    slurp
  ];
}
