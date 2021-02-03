defmodule Bus.Server do
  alias Bus.Stash

  use GenServer

  def start_link([]) do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init([]) do
    {:ok, []}
    end

  def handle_cast({:set, {user, value}}, state) do
    Stash.set_state(user, value)
    {:noreply, state}
  end

  def handle_call({:get, user}, _from, state) do
    value = Stash.get_state(user)
    {:reply, value, state}
  end

  def call(args) do
    GenServer.call(__MODULE__, args)
  end

  def cast(args) do
    GenServer.cast(__MODULE__,  args)
  end

end
