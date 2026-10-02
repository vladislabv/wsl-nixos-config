# vstasenko Dendritic NixOS WSL Setup

This repository follows a **dendritic (modular) NixOS flake structure** for maximum scalability and clean separation of concerns.

## Directory Tree
```text
├── flake.nix             # Root flake wiring inputs and hosts
├── hosts/
│   └── wsl/
│       └── default.nix   # Host-specific configuration (WSL)
├── modules/
│   └── nixos/
│       ├── core.nix      # Core system settings & packages
│       └── podman.nix    # Containerization module
├── users/
│   └── vstasenko/
│       └── home.nix      # Home Manager user configuration & dev tools
├── templates/
│   └── devenv.nix        # Project-level devenv template (replacing mise)
└── README.md
```

## Installation on a New PC (Pure NixOS WSL)

1. **Install NixOS-WSL**:
   Download the latest NixOS-WSL tarball release from [NixOS-WSL GitHub Releases](https://github.com/nix-community/NixOS-WSL/releases).

   In Windows PowerShell (as Administrator):
   ```powershell
   wsl --import NixOS C:\NixOS path\to\nixos-wsl-x86_64-linux.tar.gz --version 2
   wsl -d NixOS
   ```

2. **Clone this repository inside NixOS WSL**:
   ```bash
   git clone <your-dotfiles-repo-url> ~/nixos-wsl
   cd ~/nixos-wsl
   ```

3. **Build and Switch to your Dendritic NixOS Configuration**:
   ```bash
   sudo nixos-rebuild switch --flake .#wsl
   ```

4. **Restart WSL**:
   In PowerShell on Windows:
   ```powershell
   wsl --terminate NixOS
   wsl -d NixOS
   ```
