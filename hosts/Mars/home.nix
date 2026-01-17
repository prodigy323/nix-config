{ pkgs, ... }:

{
  programs.git = {
    enable = true;
    settings = {
      user.name = "Joe Hong";
      user.email = "jhng323@gmail.com";
    };
  };

  programs.zsh = {
    initContent = ''
      # load per-host aliases for Mars
      if [ -f "$HOME/.config/zsh/zsh_aliases_mars" ]; then
        source "$HOME/.config/zsh/zsh_aliases_mars"
      fi

      # load per-host functions for Mars
      if [ -f "$HOME/.config/zsh/zsh_functions_mars" ]; then
        source "$HOME/.config/zsh/zsh_functions_mars"
      fi
    '';
  };

  xdg.configFile."zsh/zsh_aliases_mars".text = ''
    alias vi="nvim"
    alias ndb="sudo darwin-rebuild build --flake .#Mars"
    alias nds="sudo darwin-rebuild switch --flake .#Mars"
  '';
}

