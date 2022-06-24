 # Toy service: Simple CI Server

Using Nix following the presentation by Gabriella Gonzales on the Bay Area Haskell Users Group [YT channel](https://www.youtube.com/watch?v=NQJVNvxgDqg&list=WL&index=50&t=2444s)

Live demo of programming and deploying a simple ci server, linked with Github webhooks (very minimalistic for the sake of the length of the talk)

More capabilities added in [simple-ci](https://github.com/Gabriella439/slides/tree/main/simple-ci)

# 1. Outline

When to use Cabal instead of Stack?
- Cabal integrates better with Nix, Nix can provide not only compiler but also Haskell packages. And the Cabal will pick up those Haskell packages correctly.
- Whereas Stack uses its own packages which are not necessarily the same as the ones in Nix.

Inside a `nix-shell` and located in the directory where we will be building our project we run `cabal init`

```
[nix-shell:/simple-ci]$ cabal init
```



