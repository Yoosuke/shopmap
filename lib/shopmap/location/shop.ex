defmodule Shopmap.Location.Shop do
  use Ecto.Schema
  import Ecto.Changeset


  schema "shops" do
    field :info, :string
    field :lat, :float
    field :lng, :float
    field :name, :string
    field :rank, :integer

    timestamps()
  end

  @doc false
  def changeset(shop, attrs) do
    shop
    |> cast(attrs, [:lat, :lng, :name, :info, :rank])
    |> validate_required([:lat, :lng, :name, :info, :rank])
  end
end
