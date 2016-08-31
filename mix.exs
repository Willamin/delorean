defmodule Delorean.Mixfile do
  use Mix.Project

  def project do
    [app: :delorean,
     version: "1.2.0",
     elixir: "~> 1.3",
     package: package(),
     description: description(),
     name: "Delorean",
     deps: deps()]
  end

  def application do
    [applications: [:logger]]
  end

  defp deps do
    [{:ex_doc, ">= 0.0.0", only: :dev}]
  end

  defp description do
    """
    A simple helper module to provide the ability to tranform dates in a
    pipeline for increased simplicity and readability.
    """
  end

  defp package do
   [
    name: :delorean,
    files: ["lib", "mix.exs", "README.md", "LICENSE.md"],
    maintainers: ["Will Lewis"],
    licenses: ["MIT"],
    links: %{"GitHub" => "https://github.com/willamin/delorean"}]
 end
end
