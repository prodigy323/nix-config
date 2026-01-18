{ ... }:

{
  system.defaults = {

    # disable the Dock altogether; includes the use of LaunchPad
    dock = {
      autohide = true;
      autohide-delay = 1000.0; # effectively never
      autohide-time-modifier = 0.0;
      tilesize = 36;
      show-recents = false;
      mru-spaces = false;
      persistent-apps = [];
      persistent-others = [];
      launchanim = false;

      # re-enable Dock; if needed
      #autohide-delay = 0.0;
      #autohide = true;
    };

    finder = {
      AppleShowAllExtensions = true;
      ShowPathbar = true;
      ShowStatusBar = true;
    };

    NSGlobalDomain = {
      AppleShowAllExtensions = true;
      KeyRepeat = 2;
      InitialKeyRepeat = 15;
      ApplePressAndHoldEnabled = false;
    };
  };

  # App-specific defaults (best practice)
  system.defaults.CustomUserPreferences = {
    "com.microsoft.VSCode" = {
      ApplePressAndHoldEnabled = false;
    };
  };
}

