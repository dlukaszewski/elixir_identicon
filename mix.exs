defmodule Identicon.MixProject do
  use Mix.Project

  def project do
    [
      app: :identicon_dlukaszewski,
      version: "0.1.0",
      elixir: "~> 1.11",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env() == :prod,
      description: description(),
      package: package(),
      deps: deps(),
      name: "dlukaszewski",
      source_url: "https://github.com/dlukaszewski/elixir_identicon"

    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:egd, github: "erlang/egd", manager: :rebar3},
      {:ex_doc, "~> 0.23.0", only: :dev, runtime: false},
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end

  defp description() do
    "A simple app that generates identicon from string to png file."
  end
  defp package() do
    [
      # This option is only needed when you don't want to use the OTP application name
      name: "identicon_dlukaszewski,x",
      # These are the default files included in the package
      files: ~w(lib priv .formatter.exs mix.exs README* readme* LICENSE*
                license* CHANGELOG* changelog* src),
      licenses: ["Apache-2.0"],
      links: %{"GitHub" => "https://github.com/dlukaszewski/elixir_identicon"}
    ]
  end
end
