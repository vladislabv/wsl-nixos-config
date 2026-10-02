{ config, pkgs, ... }:

{
  home.username = "vstasenko";
  home.homeDirectory = "/home/vstasenko";
  home.stateVersion = "24.11";

  # All user developer tools and CLI utilities managed via Home Manager (using devenv instead of mise)
  home.packages = with pkgs; [
    # Core CLI & Search
    git
    git-lfs
    vim
    neovim
    tmux
    fzf
    ripgrep
    jq
    unzip
    tar
    
    # Dev workflow & Cloud (devenv replaces mise)
    devenv
    zoxide
    starship
    lazydocker
    gh
    opentofu
    tofu
    terragrunt
    uv
    python3
    go
    nodejs
  ];

  # Enable home-manager
  programs.home-manager.enable = true;

  # Starship prompt configuration integration
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };

  # Zoxide integration
  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  # Git configuration for vstasenko
  programs.git = {
    enable = true;
    userName = "vladislabv";
    userEmail = "stasenko_vladislav@protonmail.com";
    extraConfig = {
      init.defaultBranch = "main";
      filter.lfs = {
        clean = "git-lfs clean -- %f";
        smudge = "git-lfs smudge -- %f";
        process = "git-lfs filter-process";
        required = true;
      };
    };
  };

  systemd.user.startServices = "sd-switch";
}
