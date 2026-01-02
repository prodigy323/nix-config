{
  homebrew = {
    enable = true;
    brewPrefix = "/opt/homebrew/bin";

    taps = [
      #"homebrew/core"
      #"homebrew/cask"
    ];

    brews = [
      "jq"
      "ripgrep"
      #"fd"
      #"gh"
    ];

    casks = [
      "ghostty"
      #"google-chrome"
      #"visual-studio-code"
      #"raycast"
      #"1password"
    ];

    onActivation = {
      upgrade = true;
      cleanup = "none"; # switch to "uninstall" later
    };
  };
}

