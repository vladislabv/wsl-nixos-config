{ config, pkgs, ... }:

{
  # Enable Podman and Docker compatibility
  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
    defaultNetwork.settings.dns_enabled = true;
  };

  users.users.vstasenko.extraGroups = [ "docker" "podman" ];
}
