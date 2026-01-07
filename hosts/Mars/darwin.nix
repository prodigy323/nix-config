{ username, ... }:

{
  system.primaryUser = username;
  networking.hostName = "Joes-MacBook-Pro";

  homebrew = {
    brews = [
      "httpie"
      "mise"
    ];

    casks = [
      "visual-studio-code"
    ];
  };
}

