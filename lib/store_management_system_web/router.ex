defmodule StoreManagementSystemWeb.Router do
  use StoreManagementSystemWeb, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_live_flash)
    plug(:put_root_layout, {StoreManagementSystemWeb.Layouts, :root})
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/", StoreManagementSystemWeb do
    pipe_through(:browser)

    live("/stores", StoreLive.Index, :index)
    live("/stores/new", StoreLive.Index, :new)
    live("/stores/:id/edit", StoreLive.Index, :edit)

    live("/stores/:id", StoreLive.Show, :show)
    live("/stores/:id/show/edit", StoreLive.Show, :edit)

    live("/products", ProductLive.Index, :index)
    live("/products/new", ProductLive.Index, :new)
    live("/products/:id/edit", ProductLive.Index, :edit)

    live("/products/:id", ProductLive.Show, :show)
    live("/products/:id/show/edit", ProductLive.Show, :edit)

    live "/employees", EmployeeLive.Index, :index

    get("/", PageController, :home)
  end

  # Other scopes may use custom stacks.
  # scope "/api", StoreManagementSystemWeb do
  #   pipe_through :api
  # end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:store_management_system, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through(:browser)

      live_dashboard("/dashboard", metrics: StoreManagementSystemWeb.Telemetry)
      forward("/mailbox", Plug.Swoosh.MailboxPreview)
    end
  end
end
