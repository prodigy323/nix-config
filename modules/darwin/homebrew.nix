{
  homebrew = {
    enable = true;
    prefix = "/opt/homebrew";

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
      "httpie"
    ];

    casks = [
      "1password"
      "1password-cli"
      #"brave-browser"
      "dropbox"
      "expressvpn"
      #"firefox"
      #"google-chrome"
      "google-drive"
      "obsidian"
      "todoist"
      "todoist-app"
      "visual-studio-code"
      "font-meslo-lg-nerd-font"
      "font-symbols-only-nerd-font"
      "ghostty"
      #"iterm2"
      "raycast"
      "shottr"
    ];

    onActivation = {
      upgrade = true;
      cleanup = "uninstall"; # switch to "none" or "uninstall"
    };
  };
}

