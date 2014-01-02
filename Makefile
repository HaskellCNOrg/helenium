
STYLE=stylish-haskell
DIST=dist

SC=./dist/build/taobao-search/taobao-search

default: build

init:
	cabal sandbox init
	cabal install --job=2 --only-dependencies --enable-tests

clean:
	cabal clean

build:
	cabal configure
	cabal build

sc: build
	$(SC)

hlint:
	$(STYLE) -i src/**/*.hs test/**/*.hs
	hlint src/ --report=$(DIST)/hlint.html
