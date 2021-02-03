defmodule App.Mixfile do
  use Mix.Project

  def project do
    [app: :app,
    build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      elixir: "~> 1.11",
     version: "0.1.0",
     elixir: "~> 1.3",
     default_task: "server",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps(),
     aliases: aliases()]
  end

  def application do
    [applications: [:logger, :nadia, :poison, :bus],
     mod: {App, []}]
  end

  defp deps do
    [
      {:nadia, "~> 0.6.0"},
      {:poison, "~> 3.1"},
    ]
  end

  defp aliases do
    [server: "run --no-halt"]
  end
end
