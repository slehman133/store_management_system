defmodule StoreManagementSystem.Entries.Store do
  use Ecto.Schema
  import Ecto.Changeset

  alias StoreManagementSystem.Entries.Product

  schema "stores" do
    field(:location, :string)
    field(:store_id_number, :integer)
    has_many(:products, Product)
    timestamps()
  end

  @doc false
  def changeset(store, attrs) do
    store
    |> cast(attrs, [:location, :store_id_number])
    |> validate_required([:location, :store_id_number])
  end
end
