defmodule Inktoberfest.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Inktoberfest.Repo,
      # Start the Telemetry supervisor
      InktoberfestWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Inktoberfest.PubSub},
      # Start the Endpoint (http/https)
      InktoberfestWeb.Endpoint
      # Start a worker by calling: Inktoberfest.Worker.start_link(arg)
      # {Inktoberfest.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Inktoberfest.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    InktoberfestWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
