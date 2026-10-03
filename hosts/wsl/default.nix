{ config, pkgs, ... }:

{
  imports = [
    ../../modules/nixos/core.nix
    ../../modules/nixos/podman.nix
  ];

  wsl = {
    enable = true;
    defaultUser = "vstasenko";
    nativeSystemd = true;
    wslConf = {
      interop.appendWindowsPath = false;
      user.default = "vstasenko";
    };
  };

  networking.hostName = "nixos-wsl";
}
