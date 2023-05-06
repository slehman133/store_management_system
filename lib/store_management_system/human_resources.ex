defmodule StoreManagementSystem.HumanResources do
  alias StoreManagementSystem.HumanResources.Employee

  def list_employees do
    with {:ok, response} = HTTPoison.get("http://localhost:4000/api/employees"),
         {:ok, values} = Jason.decode(response.body) do
      keys_to_atoms(values["data"])
      |> Enum.map(&struct(Employee, &1))
    end
  end

  def keys_to_atoms(json_list) do
    json_list
    |> Enum.map(fn row ->
      row
      |> Enum.map(fn {k, v} -> {String.to_atom(k), v} end)
      |> Enum.into(%{})
    end)
  end
end
