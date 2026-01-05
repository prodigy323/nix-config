{ pkgs, ... }:

{
  programs.git = {
    enable = true;
    settings = {
      user.name = "Joe Hong";
      user.email = "jhng323@gmail.com";
    };
  };

  xdg.configFile."zsh/zsh_aliases_mars".text = ''
    alias vi = nvim
    alias ndb = "sudo darwin-rebuild build --flake .#Mars
    alias nds = "sudo darwin-rebuild switch --flake .#Mars
  '';
}

