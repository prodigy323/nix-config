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
      "mise"
      "sevenzip"
      #"tmux"
      #"zellij"
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
      "raycast"
      "shottr"
      "todoist"
      "todoist-app"
      "visual-studio-code"
      #"warp"
    ];
  };
}
