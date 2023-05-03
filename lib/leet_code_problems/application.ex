defmodule LeetCodeProblems.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      LeetCodeProblemsWeb.Telemetry,
      # Start the Ecto repository
      LeetCodeProblems.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: LeetCodeProblems.PubSub},
      # Start Finch
      {Finch, name: LeetCodeProblems.Finch},
      # Start the Endpoint (http/https)
      LeetCodeProblemsWeb.Endpoint
      # Start a worker by calling: LeetCodeProblems.Worker.start_link(arg)
      # {LeetCodeProblems.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: LeetCodeProblems.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    LeetCodeProblemsWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
