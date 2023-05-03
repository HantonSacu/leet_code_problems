defmodule LeetCodeProblems.Repo do
  use Ecto.Repo,
    otp_app: :leet_code_problems,
    adapter: Ecto.Adapters.Postgres
end
