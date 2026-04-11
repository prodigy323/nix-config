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
      "1password"
      "1password-cli"
      "dropbox"
      #"expressvpn"
      #"google-chrome"
      #"google-drive"
      "obsidian"
      #"parallels"
      "todoist"
      "todoist-app"
      "visual-studio-code"
      #"warp"
    ];
  };
}
