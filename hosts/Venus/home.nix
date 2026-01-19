{ pkgs, ... }:

{
  imports = [
    ./aws.nix
  ];

  programs.git = {
    enable = true;
    settings = {
      user.name = "Joe Hong";
      user.email = "joe.hong@staxpayments.com";
    };
  };

  programs.zsh = {
    initContent = ''
      # load per-host aliases for Venus
      if [ -f "$HOME/.config/zsh/zsh_aliases_venus" ]; then
        source "$HOME/.config/zsh/zsh_aliases_venus"
      fi

      # load per-host functions for Venus
      if [ -f "$HOME/.config/zsh/zsh_functions_venus" ]; then
        source "$HOME/.config/zsh/zsh_functions_venus"
      fi
    '';
  }

  xdg.configFile."zsh/zsh_aliases_venus".text = ''
    alias rm="trash"
    alias tf="terraform"
    alias uorc="uv run /Users/joehong/Dropbox/scripts/reader_get_inbox.py"
    alias ave="aws-vault exec"
    alias bu="bash /Users/joehong/Dropbox/scripts/homebrew-upgrade-with-cask-wrapper.sh"
    alias awsls2="aws ec2 describe-instances --query \"Reservations[].Instances[].{name: Tags[?Key=='Name'] | [0].Value, instance_id: InstanceId, private_address: PrivateIpAddress, public_address: PublicIpAddress, os: PlatformDetails, state: State.Name}\" --output table --profile $1"
    alias cat="bat -Pp"
    alias ez="eza -F --long --all --no-permissions --no-user --group-directories-first --icons=always --time modified --time-style=long-iso --total-size"
    alias gb="git --no-pager branch"
    alias vi="nvim"
    alias rm="trash"
    alias rmdir="trash"
    alias ls="colorls --group-directories-first"
    alias l="ls -1"
    alias randpw="bash /Users/joehong/Dropbox/scripts/1password-generate-random-password.sh -l20 -s"
    alias fzf="fzf --preview 'bat --style=numbers --color=always {}'"
    alias qn="vi /tmp/quicknotes"
    alias zas="zellij attach stax"
    alias vpnad="aws ssm start-session --target i-06c9a82db19a94fe3 --profile vcentralauth"
    alias ngfw="aws logs start-live-tail --log-group-identifiers arn:aws:logs:us-west-2:120245984563:log-group:PaloAltoCloudNGFW --profile vnetsecops"
    alias qsps="aws ssm-quicksetup list-configuration-managers --profile vmgmt | jq '.ConfigurationManagersList[] | select(.StatusSummaries[]? | .StatusType==\"AsyncExecutions\" and .Status==\"FAILED\") | { Description, Name, StatusSummaries: [ ( .StatusSummaries[] | select(.StatusType==\"AsyncExecutions\" and .Status==\"FAILED\") | { LastUpdatedAt, Status, failed: .StatusDetails.failed }) ] } | select(.Name | contains(\"Patch-Policy\"))'"
    alias stsvpnssh="TERM=xterm ssh joe.hong@10.176.66.8"
  '';

  xdg.configFile."zsh/zsh_functions_venus".text = ''
    alu() {
        # Search AWS accounts and OUs (AWS LookUp)
        ID=$1
        grep -i $ID /Users/joehong/localdev/reference/apps-ssm-org-ids.txt
        grep -i $ID /Users/joehong/localdev/reference/stax-org-ids.txt | sed 's/$/ - Stax Org/'
    }

    # function alias to execute `uv run` on python scripts
    function uvr() {
        # python uv run
        uv run "$@"
    }

    # yazi
    y() {
        # open yazi - command line directory tree
        local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
        yazi "$@" --cwd-file="$tmp"
        if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
                builtin cd -- "$cwd"
        fi
        rm -f -- "$tmp"
    }

    ecsexec() {
    # ECS Exec
        read "clustername?Cluster Name: "
        read "taskid?Task ID: "
        read "containername?Container Name: "
        read "command?Command (ex. '/bin/sh'): "
        read "profile?Profile: "
        aws ecs execute-command --cluster "$clustername" --task "$taskid" --container "$containername" --command "$command" --interactive --profile "$profile"
    }

    listfuncs() {
        # List custom functions defined in ~/.zsh_functions
        emulate -L zsh            # isolate environment, reset options
        setopt localoptions noxtrace noshwordsplit

        local func_file="$HOME/.zsh_functions"

        if [[ ! -f $func_file ]]; then
            echo "⚠️  File not found: $func_file"
            return 1
        fi

        echo "📜 Functions defined in $func_file:"
        echo "------------------------------------"

        # Extract function names (supports "function name" and "name()")
        local funcs
        funcs=($(grep -E '^[[:space:]]*(function[[:space:]]+)?[A-Za-z0-9_-]+\s*\(\)' "$func_file" \
            | sed -E 's/^[[:space:]]*(function[[:space:]]+)?([A-Za-z0-9_-]+)\s*\(\).*/\2/'))

        local fn start desc
        for fn in "${funcs[@]}"; do
            start=$(grep -n -m1 -E "^[[:space:]]*(function[[:space:]]+)?${fn}\s*\(\)" "$func_file" | cut -d: -f1)
            desc=$(tail -n +"$((start + 1))" "$func_file" \
            | grep -m1 -E '^[[:space:]]*#' \
            | sed -E 's/^[[:space:]]*# ?//')

            [[ -z $desc ]] && desc="(no description)"
            printf "🔹 %-20s → %s\n" "$fn" "$desc"
        done
    }

    ec2ls() {
        # list EC2 instances
        read "profile?Profile: "
        read "region?Region: "
        aws ec2 describe-instances \
            --query "Reservations[].Instances[].{name: Tags[?Key=='Name'] | [0].Value, instance_id: InstanceId, private_address: PrivateIpAddress, public_address: PublicIpAddress, os: PlatformDetails, state: State.Name}" \
            --output table \
            --profile "$profile" \
            --region "$region"
    }
  '';

  # mise - per-host override
  #xdg.configFile."mise/config.toml".text = ''
  #  [tools]
  #  node = "24.13.0"
  #  python = "3.14.2"
  #'';
}
