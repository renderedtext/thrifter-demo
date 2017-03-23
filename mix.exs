defmodule ThrifterDemo.Mixfile do
  use Mix.Project

  @use_generated_client [:dev, :test]

  def project do
    [app: :thrifter_demo,
     version: "1.0.3",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     compilers: [:thrift | Mix.compilers],
     thrift_files: Mix.Utils.extract_files(["thrift"], [:thrift]),
     deps: deps]
  end

  def application do
    [applications: [:logger, :thrifter, ] ++ apps(Mix.env),
     mod: {ThrifterDemo, []}]
  end

  def apps(env) do
    if env in @use_generated_client do
      [:thrifter_demo_generated_client]
    else
      []
    end
  end

  defp deps do
    [
      {:thrifter, github: "renderedtext/thrifter", ref: "origin/master"},
#      {:thrifter, path: "../thrifter"},
      {:thrifter_demo_generated_client, git: "git@github.com:renderedtext/thrifter-demo-generated-client.git", only: @use_generated_client},
      {:distillery, "~> 1.0"},
    ]
  end
end
