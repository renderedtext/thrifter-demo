PHONY: client.build client.test

PROJ_NAME:=thrifter_demo
RELEASE_DIR=_build/prod/rel/$(PROJ_NAME)/

test: generate.client
	mix deps.update thrifter_demo_generated_client
	mix test

generate.client:
	mix thrifter.elixir

client.build:
	cd gen/elixir-client; MIX_ENV=prod mix do deps.get, compile

client.test:
	cd gen/elixir-client; MIX_ENV=prod mix

release:
	MIX_ENV=prod mix release --env=prod
	ln -sf ../`ls $(RELEASE_DIR)/releases/*/ -d -1 | sort | tail -1`/$(PROJ_NAME).tar.gz rel/$(PROJ_NAME).tar.gz

DOCKER_HOST=`netstat -nr | grep '^0\.0\.0\.0' | awk '{print $$2}'`
container.run:
	echo STATSD_HOST=$(DOCKER_HOST)
	STATSD_HOST=$(DOCKER_HOST) bin/$(PROJ_NAME) foreground

