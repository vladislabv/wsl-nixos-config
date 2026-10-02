{ pkgs, ... }:

{
  # This is a sample devenv.nix file to use in your projects instead of .mise.toml
  # Run `devenv init` in any project folder to get started.

  languages.python.enable = true;
  languages.python.package = pkgs.python312;
  languages.python.uv.enable = true;

  languages.javascript.enable = true;
  languages.javascript.package = pkgs.nodejs_22;

  languages.go.enable = true;
  languages.go.package = pkgs.go;

  # Optional: services like postgres, redis, mysql
  # services.postgres.enable = true;

  enterShell = ''
    echo "🚀 Entering devenv isolated environment!"
    python --version
    node --version
    go version
  '';
}
