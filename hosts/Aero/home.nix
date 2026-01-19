{ pkgs, ... }:

{
  imports = [
    ./aws.nix
  ];

  programs.git = {
    enable = true;
    settings = {
      user.name = "Joe Hong";
      user.email = "jhng323@gmail.com";
    };
  };

  programs.zsh = {
    initContent = ''
      # load per-host aliases for Aero
      if [ -f "$HOME/.config/zsh/zsh_aliases_aero" ]; then
        source "$HOME/.config/zsh/zsh_aliases_aero"
      fi

      # load per-host functions for Aero
      if [ -f "$HOME/.config/zsh/zsh_functions_aero" ]; then
        source "$HOME/.config/zsh/zsh_functions_aero"
      fi
    '';
  }

  xdg.configFile."zsh/zsh_aliases_aero".text = ''
    alias vi="nvim"
  '';

  # mise - per-host override
  #xdg.configFile."mise/config.toml".text = ''
  #  [tools]
  #  node = "24.13.0"
  #  python = "3.14.2"
  #'';
}
