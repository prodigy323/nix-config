{ pkgs, config, lib, ... }:

{
  home.stateVersion = "23.11";

  programs.git.enable = true;

  # Example dotfile
  # home.file.".zshrc".source = ./dotfiles/zshrc;

  home.packages = with pkgs; [
    mise
    fd
  ];

  home.activation.createLocalDevDir = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    mkdir -p "$HOME/localdev"
  '';

  ## Starship
  programs.starship.enable = true;
  xdg.configFile."starship.toml".source = ../../dotfiles/starship/starship.toml;

  ## FZF
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  ## Zsh + Oh-My-Zsh
  programs.zsh = {
    enable = true;

    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";

      plugins = [
        "git"
        "docker"
        "kubectl"
        "aws"
      ];
    };

    # Extra shell init (this is where Starship hooks in)
    initContent = ''
      bindkey -v
      eval "$(starship init zsh)"
      eval "$(mise activate zsh)"

      # load shared aliases
      if [ -f "$HOME/.config/zsh/zsh_aliases" ]; then
        source "$HOME/.config/zsh/zsh_aliases"
      fi

      # load shared functions
      if [ -f "$HOME/.config/zsh/zsh_functions" ]; then
        source "$HOME/.config/zsh/zsh_functions"
      fi
    '';
  };

  ## Ghostty
  xdg.configFile."ghostty/config".text = ''
    # Key Bindings
    keybind = global:cmd+y=toggle_quick_terminal

    # Options
    quick-terminal-position = center
    # disable animation
    quick-terminal-animation-duration = 0
    # don't hide when quick term loses focus
    quick-terminal-autohide = false
  '';

  ## mise - set global versions; can be overridden for each host, as well as for each project
  xdg.configFile."mise/config.toml".text = ''
    [tools]
    node = "24.13.0"
    python = "3.14.2"
  '';

  # mise - execute install and reshim when global versions changes in ~/.config/mise/config.toml
  home.activation.miseInstall = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    set -euo pipefail

    MISE_CFG="$HOME/.config/mise/config.toml"
    STAMP_DIR="$HOME/.local/state/nix-darwin"
    STAMP_FILE="$STAMP_DIR/mise-config.sha256"

    # Only run if mise config exists
    if [ ! -f "$MISE_CFG" ]; then
      echo "mise config not found at $MISE_CFG; skipping"
      exit 0
    fi

    mkdir -p "$STAMP_DIR"

    NEW_HASH="$(/usr/bin/shasum -a 256 "$MISE_CFG" | /usr/bin/awk '{print $1}')"
    OLD_HASH="$(cat "$STAMP_FILE" 2>/dev/null || true)"

    if [ "$NEW_HASH" = "$OLD_HASH" ]; then
      echo "mise config unchanged; skipping install/reshim"
      exit 0
    fi

    echo "mise config changed; running mise install + reshim"

    # Run as the user, with a sane HOME
    ${pkgs.mise}/bin/mise install
    ${pkgs.mise}/bin/mise reshim

    echo "$NEW_HASH" > "$STAMP_FILE"
  '';

  ## zsh_aliases
  xdg.configFile."zsh/zsh_aliases".text = ''
    alias rm="trash"
    alias rmdir="trash"
    alias cat="bat -Pp"
    alias ls="eza --group-directories-first"
    alias l="ls -1"
    alias fzf="fzf --preview 'bat --style=numbers --color=always {}'"
  '';
}

