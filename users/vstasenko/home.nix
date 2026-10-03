{ config, pkgs, ... }:

{
  home.username = "vstasenko";
  home.homeDirectory = "/home/vstasenko";
  home.stateVersion = "24.11";

  # All user developer tools and CLI utilities managed via Home Manager (using devenv)
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
    gnutar
    
    # Dev workflow & Cloud
    devenv
    zoxide
    starship
    lazydocker
    gh
    opentofu
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

  # Git configuration for vstasenko (using modern settings syntax)
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "vladislabv";
        email = "stasenko_vladislav@protonmail.com";
      };
      init = {
        defaultBranch = "main";
      };
      filter = {
        "lfs" = {
          clean = "git-lfs clean -- %f";
          smudge = "git-lfs smudge -- %f";
          process = "git-lfs filter-process";
          required = true;
        };
      };
    };
  };

  # Declaratively link dotfiles via XDG config
  xdg.configFile."zsh".source = ./../../dotfiles/zsh;
  xdg.configFile."starship.toml".source = ./../../dotfiles/starship.toml;
  xdg.configFile."nvim".source = ./../../dotfiles/nvim;

  # Ensure ~/.zshenv points Zsh to XDG config dir
  home.file.".zshenv".text = ''
    export ZDOTDIR=$HOME/.config/zsh
    [[ -f $ZDOTDIR/.zshenv ]] && . $ZDOTDIR/.zshenv
  '';
}
