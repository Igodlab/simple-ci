 # Toy service: Simple CI Server

Using Nix following the presentation by Gabriella Gonzales on the Bay Area Haskell Users Group [YT channel](https://www.youtube.com/watch?v=NQJVNvxgDqg&list=WL&index=50&t=2444s)

Live demo of programming and deploying a simple ci server, linked with Github webhooks (very minimalistic for the sake of the length of the talk)

More capabilities added in [simple-ci](https://github.com/Gabriella439/slides/tree/main/simple-ci)

# 1. Setup

To get started from scratch we need Nix, `cabal2nix`, `nix-prefetch-git` and `cabal` installed.

We can install the Nix *single-user* which has the advantages of not creating a daemon nor a socket. Plus nothing is written into `/etc`. So update curl and install `nix`

```bash
$ sudo sh -c "apt update && apt install curl"
$ sh <(curl -L https://nixos.org/nix/install) --no-daemon)
```

now proceed with the installation of 

```bash
$ nix-env --install cabal2nix
$ nix-env --install nix-prefetch-git
```


lastly, if you have not already installed `cabal` you can use nix to do it

```bash
$ nix-env --install cabal-install
```



# 2. Outline

When to use Cabal instead of Stack?
- Cabal integrates better with Nix, Nix can provide not only compiler but also Haskell packages. And the Cabal will pick up those Haskell packages correctly.
- Whereas Stack uses its own packages which are not necessarily the same as the ones in Nix.

Inside a `nix-shell` and located in the directory where we will be building our project we run `cabal init`

```bash
[nix-shell:/simple-ci]$ cabal init
```



