{ config, pkgs, ... }:

{
  time.timeZone = "UTC";
  i18n.defaultLocale = "en_US.UTF-8";

  # Enable zsh system-wide
  programs.zsh.enable = true;

  # Define user vstasenko
  users.users.vstasenko = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
    shell = pkgs.zsh;
    initialHashedPassword = "";
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable flakes and experimental features
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # System-wide packages (including git so root/nixos-rebuild can evaluate git flakes)
  environment.systemPackages = with pkgs; [
    git
    git-lfs
    wget
    curl
    gawk
    coreutils
    findutils
    rsync
    dnsutils
    iproute2
  ];

  # Enable Git system-wide
  programs.git.enable = true;

  system.stateVersion = "24.11";
}
