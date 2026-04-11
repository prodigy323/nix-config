{ username, ... }:

{
  system.primaryUser = username;
  networking.hostName = "Joes-MacBook-Pro";

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
