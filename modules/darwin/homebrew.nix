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
      "jq"
      "ripgrep"
      "fd"
      "fzf"
      "neovim"
      "nmap"
      "tlrc"
      "trash"
      "tree"
      "ruff"
      "uv"
      "yq"
      "zoxide"
    ];

    casks = [
      #"1password"
      #"1password-cli"
      "brave-browser"
      #"firefox"
      "ghostty"
      #"google-chrome"
      #"google-drive"
      #"iterm2"
      #"obsidian"
      #"raycast"
      #"visual-studio-code"
    ];

    onActivation = {
      upgrade = true;
      cleanup = "none"; # switch to "uninstall" later
    };
  };
}

