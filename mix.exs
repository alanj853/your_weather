defmodule YourWeather.Mixfile do
  use Mix.Project

  def project do
    [
      app: :your_weather,
      version: "0.0.1",
      elixir: "~> 1.4",
      elixirc_paths: elixirc_paths(Mix.env),
      compilers: [:phoenix, :gettext] ++ Mix.compilers,
      start_permanent: Mix.env == :prod,
      aliases: aliases(),
      deps: deps()
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {YourWeather, []},
      extra_applications: [:logger]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "web", "test/support"]
  defp elixirc_paths(_),     do: ["lib", "web"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:phoenix, "~> 1.3.3"},
      {:phoenix_pubsub, "~> 1.0"},
      {:phoenix_ecto, "~> 3.2"},
      {:postgrex, ">= 0.0.0"},
      {:phoenix_html, "~> 2.10"},
      {:phoenix_live_reload, "~> 1.0", only: :dev},
      {:gettext, "~> 0.11"},
      {:cowboy, "~> 1.0"},
      {:plug_cowboy, "~> 1.0"},
      {:absinthe, "~> 1.4.16"},
      {:absinthe_ecto, "~> 0.1.3"},
      {:absinthe_plug, "~> 1.4.7"},
      {:jason, "~> 1.2"},
      {:cors_plug, "~> 2.0"}
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to create, migrate and run the seeds file at once:
  #
  #     $ mix ecto.setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      "ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
      "ecto.reset": ["ecto.drop", "ecto.setup"],
      test: ["ecto.create --quiet", "ecto.migrate", "test"],
      compile_ng: [&compile_ng/1],
      compile: [&evaluate_compile/1]
    ]
  end

  def evaluate_compile(["--all"]) do
    Mix.Task.run("compile_ng")
    Mix.Task.run("compile")
  end

  def evaluate_compile(["--iex"]) do
    Mix.Task.run("compile")
  end

  def evaluate_compile(["--ng"]) do
    Mix.Task.run("compile_ng")
  end

  def evaluate_compile(_) do
    evaluate_compile(["--all"])
  end

  @doc """
  Function to compile the Angular App
  """
  def compile_ng(_) do
    # ng_app_path = "ng_app"
    # node_modules = "#{ng_app_path}/node_modules"
    # unless File.exists?(node_modules) do
    #   Mix.shell().info([:green, "Installing ", :reset, "node_modules"])
    #   {_, 0} = System.cmd("npm", ["install"], cd: ng_app_path)
    # else
    #   Mix.shell().info([:green, "node_modules :ok"])
    # end

    # Mix.shell().info([:green, "Building ", :reset, "ng_app"])
    # {_, 0} = System.cmd("ng", ["b"], cd: ng_app_path)
  end
end
