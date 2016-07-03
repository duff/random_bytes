defmodule RandomBytes.Mixfile do
  use Mix.Project

  @version "1.0.0"

  def project do
    [
      app: :random_bytes,
      version: @version,
      elixir: "~> 1.2",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps: deps(),
      package: package(),
      name: "RandomBytes",
      description: "Generate random strings in a few different formats.",
      docs: [
        source_ref: "v#{@version}",
        extras: ["README.md"],
        main: "readme",
        source_url: "https://github.com/duff/random_bytes"
      ]
    ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:ex_doc, "~> 0.11", only: :dev}
    ]
  end

  defp package do
    [maintainers: ["Duff O'Melia"],
     licenses: ["Apache 2.0"],
     links: %{"GitHub" => "https://github.com/duff/random_bytes"},
     files: ~w(lib mix.exs README.md LICENSE.md)]
  end
end
