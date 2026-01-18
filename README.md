# nix-config

## ⚠️ Prerequisites

- Install Xcode CLT (command-line tool):

`xcode-select --install`

- Install Nix (recommended to use [Determinate Systems installer](https://github.com/DeterminateSystems/nix-installer)):

`curl -L https://install.determinate.systems/nix | sh -s -- install`

- Verify installation

```sh
# restart terminal
# verify
nix --version
nix flake --help
```

---

## Usage

- Create local SSH key

```sh
ssh-keygen -t ed25519
```

- Add the SSH key to Github account `prodigy323`
- Clone this repository

```sh
cd ~ # or cd $HOME
git clone git@github.com:prodigy323/nix-config.git
git clone git@prodigy323.github.com:prodigy323/nix-config.git # if on Venus due to multiple github orgs
cd nix-config
```

- bootstrap `nix`

```sh
sudo nix run nix-darwin -- switch --flake .$HOST
```

- Apply `nix-darwin` configurations

```sh
sudo darwin-rebuild build --flake .#HOST # verify build
sudo darwin-rebuild switch --flake .#HOST # execute the configuration changes
```

Where HOST is...

- _Mars_ - Macbook Pro 14" M1 Pro
- _Aero_ - Macbook Air 13" M2
- _Venus_ - Macbook Pro 16" M2 Pro

---

## Directories

```arduino
nix-config/
    flake.nix
    hosts/  # per-host config
        Mars/
            host.nix  # per-host system config
            darwin.nix  # per-host nix-darwin config
            home.nix  # per-host home-manager config
        Aero/
            host.nix
            darwin.nix
            home.nix
        Venus/
            host.nix
            darwin.nix
            home.nix
    modules/
        darwin/  # base system config
            base.nix
            homebrew.nix
            macos-defaults.nix  # macOS defaults config
        home/  # base home-manager config
            base.nix
```
