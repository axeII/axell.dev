default: dev


init:
  # test if go and hugo are installed, if not install them
  which go || brew install go
  which hugo || brew install hugo

build:
  # if public exists remove it
  rm -rf public
  hugo -t blowfish


dev:
  hugo server -D -t blowfish
