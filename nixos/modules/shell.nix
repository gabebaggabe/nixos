{pkgs, ...}: {
  users.users.gabe.shell = pkgs.fish;
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
    '';
    shellAliases = {
      ff = "fastfetch";
      nrs = "sudo nixos-rebuild switch";
      svim = "sudo HOME=$HOME XDG_RUNTIME_DIR=/run/user/$(id -u) WAYLAND_DISPLAY=$WAYLAND_DISPLAY nvim";
    };
  };
}
