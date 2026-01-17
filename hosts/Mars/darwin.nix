{ username, ... }:

{
  system.primaryUser = username;
  networking.hostName = "Joes-MacBook-Pro";

  homebrew = {
    brews = [
      "httpie"
    ];

    casks = [
      "visual-studio-code"
    ];
  };
}
