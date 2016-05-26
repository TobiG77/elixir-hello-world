defmodule HelloWorld.App.Mixfile do
  use Mix.Project

  def project do
    [app: :hello_world,
     version: "0.0.1",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  def application do
    [applications:
      [:logger, :cowboy, :plug, :httpoison, :poison ],
      mod: {  HelloWorld.App, []}
    ]
  end

  defp deps do
    [
        {:exrm, "~> 1.0.5"},
        {:cowboy, "~> 1.0.3"},
        {:plug, "~> 1.0"},
        {:poison, "~> 1.5"},
        {:httpoison, "~> 0.7"}
    ]
  end
end
