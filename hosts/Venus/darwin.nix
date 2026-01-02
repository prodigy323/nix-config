{ username, ... }:

{
  system.primaryUser = username;
  networking.hostName = "JH-ST-WKDQ41R6L3";

  homebrew = {
    brews = [
      "colima"
    ];

    casks = [
      "dropbox"
    ];
  };
}
