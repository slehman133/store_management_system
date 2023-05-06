defmodule StoreManagementSystem.EntriesTest do
  use StoreManagementSystem.DataCase

  alias StoreManagementSystem.Entries

  describe "stores" do
    alias StoreManagementSystem.Entries.Store

    import StoreManagementSystem.EntriesFixtures

    @invalid_attrs %{location: nil, store_id_number: nil}

    test "list_stores/0 returns all stores" do
      store = store_fixture()
      assert Entries.list_stores() == [store]
    end

    test "get_store!/1 returns the store with given id" do
      store = store_fixture()
      assert Entries.get_store!(store.id) == store
    end

    test "create_store/1 with valid data creates a store" do
      valid_attrs = %{location: "some location", store_id_number: 42}

      assert {:ok, %Store{} = store} = Entries.create_store(valid_attrs)
      assert store.location == "some location"
      assert store.store_id_number == 42
    end

    test "create_store/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Entries.create_store(@invalid_attrs)
    end

    test "update_store/2 with valid data updates the store" do
      store = store_fixture()
      update_attrs = %{location: "some updated location", store_id_number: 43}

      assert {:ok, %Store{} = store} = Entries.update_store(store, update_attrs)
      assert store.location == "some updated location"
      assert store.store_id_number == 43
    end

    test "update_store/2 with invalid data returns error changeset" do
      store = store_fixture()
      assert {:error, %Ecto.Changeset{}} = Entries.update_store(store, @invalid_attrs)
      assert store == Entries.get_store!(store.id)
    end

    test "delete_store/1 deletes the store" do
      store = store_fixture()
      assert {:ok, %Store{}} = Entries.delete_store(store)
      assert_raise Ecto.NoResultsError, fn -> Entries.get_store!(store.id) end
    end

    test "change_store/1 returns a store changeset" do
      store = store_fixture()
      assert %Ecto.Changeset{} = Entries.change_store(store)
    end
  end

  describe "products" do
    alias StoreManagementSystem.Entries.Product

    import StoreManagementSystem.EntriesFixtures

    @invalid_attrs %{count: nil, name: nil, retail_price: nil, vendor: nil, wholesale_price: nil}

    test "list_products/0 returns all products" do
      product = product_fixture()
      assert Entries.list_products() == [product]
    end

    test "get_product!/1 returns the product with given id" do
      product = product_fixture()
      assert Entries.get_product!(product.id) == product
    end

    test "create_product/1 with valid data creates a product" do
      valid_attrs = %{count: 42, name: "some name", retail_price: 120.5, vendor: "some vendor", wholesale_price: 120.5}

      assert {:ok, %Product{} = product} = Entries.create_product(valid_attrs)
      assert product.count == 42
      assert product.name == "some name"
      assert product.retail_price == 120.5
      assert product.vendor == "some vendor"
      assert product.wholesale_price == 120.5
    end

    test "create_product/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Entries.create_product(@invalid_attrs)
    end

    test "update_product/2 with valid data updates the product" do
      product = product_fixture()
      update_attrs = %{count: 43, name: "some updated name", retail_price: 456.7, vendor: "some updated vendor", wholesale_price: 456.7}

      assert {:ok, %Product{} = product} = Entries.update_product(product, update_attrs)
      assert product.count == 43
      assert product.name == "some updated name"
      assert product.retail_price == 456.7
      assert product.vendor == "some updated vendor"
      assert product.wholesale_price == 456.7
    end

    test "update_product/2 with invalid data returns error changeset" do
      product = product_fixture()
      assert {:error, %Ecto.Changeset{}} = Entries.update_product(product, @invalid_attrs)
      assert product == Entries.get_product!(product.id)
    end

    test "delete_product/1 deletes the product" do
      product = product_fixture()
      assert {:ok, %Product{}} = Entries.delete_product(product)
      assert_raise Ecto.NoResultsError, fn -> Entries.get_product!(product.id) end
    end

    test "change_product/1 returns a product changeset" do
      product = product_fixture()
      assert %Ecto.Changeset{} = Entries.change_product(product)
    end
  end
end
