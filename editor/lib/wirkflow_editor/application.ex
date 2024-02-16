defmodule Wirkflow.Editor.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      Wirkflow.EditorWeb.Telemetry,
      Wirkflow.Editor.Repo,
      {DNSCluster, query: Application.get_env(:wirkflow_editor, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Wirkflow.Editor.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Wirkflow.Editor.Finch},
      # Start a worker by calling: Wirkflow.Editor.Worker.start_link(arg)
      # {Wirkflow.Editor.Worker, arg},
      # Start to serve requests, typically the last entry
      Wirkflow.EditorWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Wirkflow.Editor.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    Wirkflow.EditorWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
