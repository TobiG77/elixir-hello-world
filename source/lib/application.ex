defmodule HelloWorld.App do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      worker(HelloWorld.Web, [])
    ]

    opts = [strategy: :one_for_one, name: HelloWorld.Web.Supervisor]
    Supervisor.start_link(children, opts)
  end
end