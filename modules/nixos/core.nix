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

  # Minimal system-wide packages (essential utilities & drivers)
  environment.systemPackages = with pkgs; [
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
