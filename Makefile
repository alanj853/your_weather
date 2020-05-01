SHELL := /bin/bash

all: clean deps_get compile

deps_get:
	mix deps.get

compile_ng:
	mix compile --ng

compile_iex:
	mix compile --iex

compile:
	mix compile

clean: clean_web_ui clean_iex clean_deps

clean_web_ui:
	rm -rf ng_app/node_modules ng_app/dist

clean_iex:
	rm -rf _build

clean_deps:
	rm -rf deps

run:
	iex -S mix phx.server
