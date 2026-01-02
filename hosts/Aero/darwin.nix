{ username, ... }:

{
  system.primaryUser = username;
  networking.hostName = "Joes-Macbook-Air";

  homebrew = {
    brews = [
      "colima"
    ];

    casks = [
      "dropbox"
    ];
  };
}
