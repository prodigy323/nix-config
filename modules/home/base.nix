{ pkgs, ... }:

{
  home.stateVersion = "23.11";

  programs.git.enable = true;

  # Example dotfile
  # home.file.".zshrc".source = ./dotfiles/zshrc;

  ## ─────────────
  ## Starship
  ## ─────────────
  programs.starship = {
    enable = true;

    settings = {
      add_newline = false;
      command_timeout = 1000;

      character = {
        success_symbol = "[❯](bold green)";
        error_symbol = "[❯](bold red)";
      };
    };
  };

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

      if [ -f "$HOME/.config/zsh/zsh_aliases" ]; then
        source "$HOME/.config/zsh/zsh_aliases"
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
    alias ls="eza"
    alias l="ls -1"
    alias fzf="fzf --preview 'bat --style=numbers --color=always {}'"
  '';
}

