# Checkpoint 2

### Review of checkpoint 1

Until checkpoint 1 we got installed `nix`, `cabal`, `cabal2nix` & `nix-prefetch-git`. Then we wrote our configurations for nix, Haskell dependencies and our new package reference. All these in
- `config.nix`
- `default.nix`
- `shell.nix`

Lastly, we run `cabal configure`, `cabal build` and finally accesed the repl for our `Main.hs` script with `cabal repl`. We can print on screen

```bash
[nix-shell:~/simple-ci]$ cabal repl
ghci> 
ghci> main
Hello Haskell!
ghci>
```

###  

Now what we have as of now is not a service yet, it is just an executable, but we will work towards a very siple one in this checkpoint. 

So we will connect to github, then we go to the webhooks options in github and specify:

- the url import of our server (perhaps as an additional path)
- the Content type for the payload that github will send (json in this case)
- events that will trigger the webhooks

For our toy service then: anytime there is a webhook then it will send a post-request to that service of the content type that we specified.





Congrats! This is the end of **Checkpoint 2**

