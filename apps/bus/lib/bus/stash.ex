defmodule Bus.Stash do
  @agentname UserState

  @spec get_state(integer) :: any
  def get_state(user_id) do
    states = Agent.get(@agentname, &(&1))
    states[user_id]
  end

  def set_state(user_id, user_state) do

    Agent.get(@agentname, &(&1))
    |> Map.put(user_id, user_state)
    |> update_agent()
  end

  defp update_agent(new_state) do
    Agent.update(@agentname, fn (_) -> new_state end)
  end
end
