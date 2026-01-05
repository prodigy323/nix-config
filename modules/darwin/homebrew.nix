{
  homebrew = {
    enable = true;
    brewPrefix = "/opt/homebrew/bin";

    taps = [
      #"homebrew/cask-fonts"
      #"homebrew/cask"
    ];

    brews = [
      "bat"
      "btop"
      "eza"
      "fd"
      "fzf"
      "jq"
      "neovim"
      "nmap"
      "ripgrep"
      "tlrc"
      "trash"
      "tree"
      "ruff"
      "uv"
      "yq"
      "zoxide"
    ];

    casks = [
      "brave-browser"
      #"firefox"
      "ghostty"
      #"google-chrome"
      #"iterm2"
    ];

    onActivation = {
      upgrade = true;
      cleanup = "none"; # switch to "uninstall" later
    };
  };
}

