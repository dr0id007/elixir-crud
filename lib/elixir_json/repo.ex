defmodule ElixirJson.Repo do
  use Ecto.Repo,
    otp_app: :elixir_json,
    adapter: Ecto.Adapters.Postgres
end
