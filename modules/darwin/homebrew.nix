{
  homebrew = {
    enable = true;
    brewPrefix = "/opt/homebrew/bin";

    taps = [];

    brews = [
      "bat"
      "btop"
      "eza"
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
      "font-meslo-lg-nerd-font"
      "font-symbols-only-nerd-font"
    ];

    onActivation = {
      upgrade = true;
      cleanup = "none"; # switch to "uninstall" later
    };
  };
}

