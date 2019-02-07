defmodule Shopmap.LocationTest do
  use Shopmap.DataCase

  alias Shopmap.Location

  describe "shops" do
    alias Shopmap.Location.Shop

    @valid_attrs %{info: "some info", lat: 120.5, lng: 120.5, name: "some name", rank: 42}
    @update_attrs %{info: "some updated info", lat: 456.7, lng: 456.7, name: "some updated name", rank: 43}
    @invalid_attrs %{info: nil, lat: nil, lng: nil, name: nil, rank: nil}

    def shop_fixture(attrs \\ %{}) do
      {:ok, shop} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Location.create_shop()

      shop
    end

    test "list_shops/0 returns all shops" do
      shop = shop_fixture()
      assert Location.list_shops() == [shop]
    end

    test "get_shop!/1 returns the shop with given id" do
      shop = shop_fixture()
      assert Location.get_shop!(shop.id) == shop
    end

    test "create_shop/1 with valid data creates a shop" do
      assert {:ok, %Shop{} = shop} = Location.create_shop(@valid_attrs)
      assert shop.info == "some info"
      assert shop.lat == 120.5
      assert shop.lng == 120.5
      assert shop.name == "some name"
      assert shop.rank == 42
    end

    test "create_shop/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Location.create_shop(@invalid_attrs)
    end

    test "update_shop/2 with valid data updates the shop" do
      shop = shop_fixture()
      assert {:ok, %Shop{} = shop} = Location.update_shop(shop, @update_attrs)
      assert shop.info == "some updated info"
      assert shop.lat == 456.7
      assert shop.lng == 456.7
      assert shop.name == "some updated name"
      assert shop.rank == 43
    end

    test "update_shop/2 with invalid data returns error changeset" do
      shop = shop_fixture()
      assert {:error, %Ecto.Changeset{}} = Location.update_shop(shop, @invalid_attrs)
      assert shop == Location.get_shop!(shop.id)
    end

    test "delete_shop/1 deletes the shop" do
      shop = shop_fixture()
      assert {:ok, %Shop{}} = Location.delete_shop(shop)
      assert_raise Ecto.NoResultsError, fn -> Location.get_shop!(shop.id) end
    end

    test "change_shop/1 returns a shop changeset" do
      shop = shop_fixture()
      assert %Ecto.Changeset{} = Location.change_shop(shop)
    end
  end
end
