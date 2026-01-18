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
      "1password"
      "1password-cli"
      "dbeaver-community"
      "dropbox"
      "font-meslo-lg-nerd-font"
      "font-symbols-only-nerd-font"
      "google-drive"
      "obsidian"
      "royal-tsx"
      "sequel-ace"
      "todoist"
      "todoist-app"
      "visual-studio-code"
      "warp"
    ];
  };
}
