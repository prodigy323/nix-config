{ pkgs, ... }:

{
  home.stateVersion = "23.11";

  programs.git.enable = true;

  # Example dotfile
  # home.file.".zshrc".source = ./dotfiles/zshrc;

  ## ─────────────
  ## Starship
  ## ─────────────
  programs.starship.enable = true;
  xdg.configFile."starship.toml".source = ../../dotfiles/starship/starship.toml

  ## ─────────────
  ## Zsh + Oh-My-Zsh
  ## ─────────────
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

      # load shared aliases
      if [ -f "$HOME/.config/zsh/zsh_aliases" ]; then
        source "$HOME/.config/zsh/zsh_aliases"
      fi

      # load per-host aliases for Mars
      if [ -f "$HOME/.config/zsh/zsh_aliases_mars" ]; then
        source "$HOME/.config/zsh/zsh_aliases_mars"
      fi

      # load per-host aliases for Aero
      if [ -f "$HOME/.config/zsh/zsh_aliases_aero" ]; then
        source "$HOME/.config/zsh/zsh_aliases_aero"
      fi

      # load per-host aliases for Venus
      if [ -f "$HOME/.config/zsh/zsh_aliases_venus" ]; then
        source "$HOME/.config/zsh/zsh_aliases_venus"
      fi

      # load shared functions
      if [ -f "$HOME/.config/zsh/zsh_functions" ]; then
        source "$HOME/.config/zsh/zsh_functions"
      fi

      # load per-host functions for Mars
      if [ -f "$HOME/.config/zsh/zsh_functions_mars" ]; then
        source "$HOME/.config/zsh/zsh_functions_mars"
      fi

      # load per-host functions for Aero
      if [ -f "$HOME/.config/zsh/zsh_functions_aero" ]; then
        source "$HOME/.config/zsh/zsh_functions_aero"
      fi

      # load per-host functions for Venus
      if [ -f "$HOME/.config/zsh/zsh_functions_venus" ]; then
        source "$HOME/.config/zsh/zsh_functions_venus"
      fi
    '';
  };

  ## ─────────────
  ## Ghostty
  ## ─────────────
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

  ## ─────────────
  ## zsh_aliases
  ## ─────────────
  xdg.configFile."zsh/zsh_aliases".text = ''
    alias rm="trash"
    alias rmdir="trash"
    alias cat="bat -Pp"
    alias ls="eza --group-directories-first"
    alias l="ls -1"
    alias fzf="fzf --preview 'bat --style=numbers --color=always {}'"
  '';
}

