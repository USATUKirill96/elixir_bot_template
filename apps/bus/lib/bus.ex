defmodule Bus do
  use Application

  alias Bus.Server

  # API
  def set_value(user, value) do Server.cast({:set, {user, value}}) end

  def get_value(user) do Server.call({:get, user}) end


  # Server
  def start(_type, _args) do

    import Supervisor.Spec, warn: false

    children = [
      Bus.Server
    ]

    # Запустить агент с хранением стейта пользователей
    Agent.start_link(fn -> %{:hello => :world} end, name: UserState)

    opts = [strategy: :one_for_one, name: Bus.Supervisor]
    Supervisor.start_link(children, opts)
  end

end
