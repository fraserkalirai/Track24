defmodule Track24Assesment.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      Track24AssesmentWeb.Telemetry,
      Track24Assesment.Repo,
      {DNSCluster, query: Application.get_env(:track24_assesment, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Track24Assesment.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Track24Assesment.Finch},
      # Start a worker by calling: Track24Assesment.Worker.start_link(arg)
      # {Track24Assesment.Worker, arg},
      # Start to serve requests, typically the last entry
      Track24AssesmentWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Track24Assesment.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    Track24AssesmentWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
