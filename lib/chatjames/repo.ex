defmodule Chatjames.Repo do
  use Ecto.Repo,
    otp_app: :chatjames,
    adapter: Ecto.Adapters.Postgres
end
