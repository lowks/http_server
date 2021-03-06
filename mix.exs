defmodule HttpServer.Mixfile do
  use Mix.Project

  def project do
    [ app: :http_server,
      version: "0.0.1",
      elixir: "~> 0.14.1 or ~> 0.15.0 or ~> 1.0",
      deps: deps(Mix.env)
    ]
  end

  # Configuration for the OTP application
  def application do
    [
      applications: [:crypto, :cowboy],
      mod: { HttpServer, [] }
    ]
  end

  # Returns the list of dependencies in the format:
  # { :foobar, "~> 0.1", git: "https://github.com/elixir-lang/foobar.git" }
  def deps(:test) do
    deps(:dev)
  end

  def deps(:dev) do
    deps(:prod) ++
      [
        {:httpotion, github: "myfreeweb/httpotion"},
      ]
  end

  def deps(:prod) do
    [
      {:cowboy, "~> 1.0.0"}
    ]
  end
end
