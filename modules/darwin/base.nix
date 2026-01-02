{ pkgs, inputs, username, ... }:

{
  # Determinate Nix: nix-darwin must not manage the Nix installation/daemon
  nix.enable = false;

  # You can still set Nix settings even with Determinate:
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Ensure /opt/homebrew/bin is available system-wide (including activation)
  environment.systemPath = [
    "/opt/homebrew/bin"
    "/opt/homebrew/sbin"
  ];

  environment.systemPackages = with pkgs; [
    git
    vim
  ];

  programs.zsh.enable = true;

  users.users.${username} = {
    home = "/Users/${username}";
  };

  system.configurationRevision =
    inputs.self.rev or inputs.self.dirtyRev or null;

  system.stateVersion = 6;
}

