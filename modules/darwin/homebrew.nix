{
  homebrew = {
    enable = true;
    brewPrefix = "/opt/homebrew/bin";

    taps = [];

    brews = [
      "bat"
      "btop"
      "eza"
      "gnupg"
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
      "font-meslo-lg-nerd-font"
      "font-symbols-only-nerd-font"
      "ghostty"
      #"google-chrome"
      #"iterm2"
      "raycast"
      "shottr"
    ];

    onActivation = {
      upgrade = true;
      cleanup = "none"; # switch to "uninstall" later
    };
  };
}

