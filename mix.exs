defmodule QR.MixProject do
  use Mix.Project

  def project do
    [
      app: :qr,
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      compilers: [:rustler] ++ Mix.compilers,
      deps: deps(),
      rustler_crates: rustler_crates(),
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
      {:rustler, "~> 0.18.0"},
    ]
  end

  defp rustler_crates do
    [qr_nif: [
      path: "native/qr_nif",
      mode: rustc_mode(Mix.env)
    ]]
  end

  defp rustc_mode(:prod), do: :release
  defp rustc_mode(_), do: :debug

end
