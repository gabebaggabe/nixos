{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    thunar-archive-plugin
    thunar-volman
    yazi
    unzip
    _7zip-zstd
  ];
  environment.variables = {
    EDITOR = "nvim";
  };
  programs = {
    thunar.enable = true;
    xfconf.enable = true;
    yazi.enable = true;
    fuse.userAllowOther = true;
  };
}
