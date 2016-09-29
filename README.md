# ThrifterDemo

To start server:
```
MIX_ENV=prod mix compile
MIX_ENV=prod iex -S mix
```

To generate Elixir client:
```
mix thrifter.elixir
```

To use generated client:
```
cd generated/thrifter_demo_generated_client/
export THRIFTER_DEMO_HOST=localhost
export THRIFTER_DEMO_PORT=12345`
MIX_ENV=prod iex -S mix
a=ThrifterDemoGeneratedClient.Model.Complex.new %{r: 2, i: 3}
ThrifterDemoGeneratedClient.Daemon.add a,a
```
