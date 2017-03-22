
PHONY: client.build client.test

test: generate.client
	mix deps.update thrifter_demo_generated_client
	mix test

generate.client:
	mix thrifter.elixir

client.build:
	cd gen/elixir-client; MIX_ENV=prod mix do deps.get, compile

client.test:
	cd gen/elixir-client; MIX_ENV=prod mix
