defmodule StoreManagementSystemWeb.EmployeeLive.Index do
  use StoreManagementSystemWeb, :live_view

  alias StoreManagementSystem.HumanResources

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :employees, HumanResources.list_employees())}
  end
end
