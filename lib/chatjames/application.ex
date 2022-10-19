defmodule Chatjames.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Chatjames.Repo,
      # Start the Telemetry supervisor
      ChatjamesWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Chatjames.PubSub},
      # Start the Endpoint (http/https)
      ChatjamesWeb.Endpoint
      # Start a worker by calling: Chatjames.Worker.start_link(arg)
      # {Chatjames.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Chatjames.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ChatjamesWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
