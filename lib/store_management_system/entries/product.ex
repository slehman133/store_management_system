defmodule StoreManagementSystem.Entries.Product do
  use Ecto.Schema
  import Ecto.Changeset

  alias StoreManagementSystem.Entries.Store

  schema "products" do
    field :count, :integer
    field :name, :string
    field :retail_price, :float
    field :vendor, :string
    field :wholesale_price, :float
    # field :store_id, :id
    belongs_to :store, Store
    timestamps()
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:name, :vendor, :wholesale_price, :retail_price, :count, :store_id])
    |> validate_required([:name, :vendor, :wholesale_price, :retail_price, :count, :store_id])
  end
end
