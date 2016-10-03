
PHONY: client.build client.test

client.build:
	mix thrifter.elixir
	cd gen/elixir-client; MIX_ENV=prod mix do deps.get, compile

client.test:
	cd gen/elixir-client; MIX_ENV=prod mix
