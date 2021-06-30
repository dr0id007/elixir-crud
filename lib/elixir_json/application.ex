defmodule ElixirJson.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      ElixirJson.Repo,
      # Start the Telemetry supervisor
      ElixirJsonWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: ElixirJson.PubSub},
      # Start the Endpoint (http/https)
      ElixirJsonWeb.Endpoint
      # Start a worker by calling: ElixirJson.Worker.start_link(arg)
      # {ElixirJson.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ElixirJson.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    ElixirJsonWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
