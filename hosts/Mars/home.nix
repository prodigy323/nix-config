{ pkgs, ... }:

{
  programs.git = {
    enable = true;
    settings = {
      user.name = "Joe Hong";
      user.email = "jhng323@gmail.com";
    };
  };

  home.packages = with pkgs; [
    # Mars-only tools
  ];
}

