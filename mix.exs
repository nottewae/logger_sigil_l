defmodule LoggerSigilL.MixProject do
  use Mix.Project

  def project do
    [
      app: :logger_sigil_l,
      version: "0.1.3",
      elixir: "~> 1.0",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description: description(),
      package: package(),
      name: "LoggerSigilL",
      source_url: "https://github.com/nottewae/logger_sigil_l",

      docs: [
        main: "LoggerSigilL",
        extras: ["README.md"]
      ]
    ]
  end


  def application do
    [
      extra_applications: [:logger]
    ]
  end


  defp deps do
    [
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false}
    ]
  end
  defp description() do
    "LoggerSigilL provides a short syntax for logging while debugging an application, like ~w(a b c)"
  end

  defp package() do
    [
      name: "logger_sigil_l",
      files: ~w(lib .formatter.exs mix.exs README*  LICENSE* ),
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/nottewae/logger_sigil_l"}
    ]
  end
end
