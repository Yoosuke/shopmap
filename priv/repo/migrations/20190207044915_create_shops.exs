defmodule Shopmap.Repo.Migrations.CreateShops do
  use Ecto.Migration

  def change do
    create table(:shops) do
      add :lat, :float
      add :lng, :float
      add :name, :string
      add :info, :text
      add :rank, :integer

      timestamps()
    end

  end
end
