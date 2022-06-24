# First interaction with Nix

So Nix can easily be confused if we do not make the distinction between three things:

- NixOS - Operating System
- Nix - As functional package manager
- Nix Store

### Nix package manager

So when we talk about **Nix the package manager** we are talking about a package builder system that offers:

- Reproducible builds - if two independent people delvelope the exact same program (exactly line by line) upon upload to the Nix store they will be assigned the same hash.
- Isolation builds - generates an isolated environment where it builds against. This has no access to the internet so 
- Nix Store - contains hashed packages that comprise information of all the dependencies, builds, etc.. that an app requires to run.
- Nixpkgs - Is like a central repository with thousands of applications. It is possible to deploy Nixpkgs to Linux and MacOS.


### NixOS

Is a Linux distro build on top of Nix packaging system. This means that whole distribution installed in the system as a single package!

The good things:

- NixOS gives access to Nix modules that allows for convenience of setting up 

### Launching the nix-shell

Before runing the nix-shell I have made sure to have installed the single user nix following [this](https://plutus-community.readthedocs.io/en/latest/#Environment/Build/Ubuntu/) guide.

Then  I started the nix-shell from `~/Cardano-King/plutus-apps` and cd to the `simple-ci` directory which corresponds to this project. 

Inside a nix-shell we start our project with cabal

```shell
[nix-shell:~/simple-ci]$ nix-shell -p ghc --run 'cabal init'
```

boom! As usual Cabal populates an empty Haskell project in our directory.

How do we compile this? There is no ghc present (so `cabal build` will fail). Now since Nix is so convenient we can use it to provide all Haskell dependencies to then be able to compile.

Go to `~/.cabal/config` and add the flag `-- nix: True` (line 25 in my file)

```
⠇
22 -- default-user-config:
23 -- ignore-expiry: False
24 -- http-transport:
25 -- nix: False
26 -- local-no-index-repo:
remote-repo-cache: /home/igodlab/.cabal/packages
⠇
```

basically will run all cabal commands inside a nix-shell and the same nix-shell provides all Haskell compiler and packages.

and here is where the **boilerplate** of starting a project with Nix comes.

## Nix boilerplate

Have a look at Gabriella's repository to learn all of this regarding Nix in [`Gabriella439/haskell-nix`](https://github.com/Gabriella439/haskell-nix)
#### add `shell.nix` file

Open a new `shell.nix` file with vim and get started with the following content 


```
1 { packageOverrides = pkgs: { 
2      haskellPackages = pkgs.haskellPackages.override { 
3          overrides = haskellPackagesNew: haskellPackagesOld: { 
4              simple-ci = haskellPackagesNew.callPackage ./default.nix { };
5          };
6      };
7   };
8 };

```
we are adding only one Haskell package in the Haskell package set (in line 4). This package will reside in `./default.nix` that we are about to create. Follow the steps below

```shell
[nix-shell:~/simple-ci]$ cabal2nix . > default.nix
```

```

```
