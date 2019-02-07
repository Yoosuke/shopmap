defmodule Shopmap.Repo do
  use Ecto.Repo,
    otp_app: :shopmap,
    adapter: Ecto.Adapters.Postgres
end
