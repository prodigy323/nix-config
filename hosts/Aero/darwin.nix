{ username, ... }:

{
  system.primaryUser = username;
  networking.hostName = "Joes-Macbook-Air";

  homebrew = {
    brews = [
      "aws-cdk"
      "aws-vault"
      "awscli"
      "cfn-lint"
      "colima"
      "curl"
      "docker"
      "docker-compose"
      "gh"
      "httpie"
      "sevenzip"
      #"tmux"
      #"zellij"
    ];

    casks = [
      #"dbeaver-community"
      #"warp"
    ];
  };
}
