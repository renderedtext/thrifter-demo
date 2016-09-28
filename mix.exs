defmodule ThrifterDemo.Mixfile do
  use Mix.Project

  def project do
    [app: :thrifter_demo,
     version: "0.0.1",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     compilers: [:thrift | Mix.compilers],
     thrift_files: Mix.Utils.extract_files(["thrift"], [:thrift]),
     deps: deps]
  end

  def application do
    [applications: [:logger],
     mod: {ThrifterDemo, []}]
  end

  defp deps do
    [
#      {:thrifter, git: "git@github.com:renderedtext/thrifter",
#        ref: "origin/master"},
      {:thrifter, path: "../thrifter"},
    ]
  end
end
