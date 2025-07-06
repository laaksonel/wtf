build:
    cabal build
install:
    cabal install --installdir $HOME/.local/bin --overwrite-policy=always
watch:
    ghcid --command "cabal repl exe:wtf" --restart wtf.cabal
