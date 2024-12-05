defmodule RandomBytes.Mixfile do
  use Mix.Project

  @version "1.0.4"

  def project do
    [
      app: :random_bytes,
      version: @version,
      elixir: "~> 1.4",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package(),
      name: "RandomBytes",
      description: "Generate random strings in a few different formats.",
      docs: docs()
    ]
  end

  def application() do
    [
      extra_applications: [:crypto]
    ]
  end

  defp deps do
    [
      {:ex_doc, "~> 0.19", only: :dev, runtime: false}
    ]
  end

  defp package do
    [
      maintainers: ["Duff O'Melia"],
      licenses: ["Apache 2.0"],
      links: %{"GitHub" => "https://github.com/duff/random_bytes"},
      files: ~w(lib mix.exs README.md LICENSE.md)
    ]
  end

  defp docs do
    [
      source_ref: "v#{@version}",
      extras: ["README.md"],
      main: "readme",
      source_url: "https://github.com/duff/random_bytes"
    ]
  end
end
