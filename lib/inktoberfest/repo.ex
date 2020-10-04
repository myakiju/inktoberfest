defmodule Inktoberfest.Repo do
  use Ecto.Repo,
    otp_app: :inktoberfest,
    adapter: Ecto.Adapters.Postgres
end
