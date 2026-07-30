{pkgs, ...}: {
  documentation.man.enable = true;
  programs.fuse.userAllowOther = true;
  environment.systemPackages = with pkgs; [
    fuse3
    man-pages
    man-pages-posix
    nil
    nixd
    alejandra
    lua-language-server
    stylua
    vscode-langservers-extracted
    gcc
    bear
    qt6.qtdeclarative
  ];
}
