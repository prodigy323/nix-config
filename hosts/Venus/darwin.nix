{ username, ... }:

{
  system.primaryUser = username;
  networking.hostName = "JH-ST-WKDQ41R6L3";

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
      "mysql-client"
      "rbenv"
      "sevenzip"
      "tfenv"
      "thefuck"
      "tmux"
      "volta"
      "yazi"
      "zellij"
    ];

    casks = [
      "dbeaver-community"
      "royal-tsx"
      "sequel-ace"
      "warp"
    ];
  };
}
