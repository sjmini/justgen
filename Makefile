SHELL:=/bin/bash

build: 
	@cd src && dune build slang.exe --profile release
	@cp _build/default/src/slang.exe .

.PHONY: clean

clean:
	  @rm -rf _build *.exe

