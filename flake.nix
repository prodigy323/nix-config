{
  description = "macOS nix-darwin config (multi-host, Homebrew, Home Manager)";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    nix-darwin.url = "github:nix-darwin/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs @ { self, nixpkgs, nix-darwin, home-manager, ... }:
  let
    system = "aarch64-darwin";

    mkHost = hostName:
      let
        host = import ./hosts/${hostName}/host.nix;
      in
      nix-darwin.lib.darwinSystem {
        inherit system;
        specialArgs = {
          inherit inputs hostName;
          username = host.username;
        };

        modules = [
          ./modules/darwin/base.nix
          ./modules/darwin/homebrew.nix
          ./modules/darwin/macos-defaults.nix
          ./hosts/${hostName}/darwin.nix

          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.${host.username} = {
              imports = [
                ./modules/home/base.nix
                ./hosts/${hostName}/home.nix
              ];
            };
          }
        ];
      };
  in {
    darwinConfigurations = {
      Mars  = mkHost "Mars";
      Aero  = mkHost "Aero";
      Venus = mkHost "Venus";
    };
  };
}

