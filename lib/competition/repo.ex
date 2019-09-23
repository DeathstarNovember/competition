defmodule Competition.Repo do
  use Ecto.Repo,
    otp_app: :competition,
    adapter: Ecto.Adapters.Postgres
end
