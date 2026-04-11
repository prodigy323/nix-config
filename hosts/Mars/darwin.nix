{ username, ... }:

{
  system.primaryUser = username;
  networking.hostName = "Joes-MacBook-Pro.local";

  homebrew = {
    brews = [
      # "aws-cdk"
      # "aws-vault"
      # "awscli"
    ];

    casks = [
      "visual-studio-code"
    ];
  };
}
