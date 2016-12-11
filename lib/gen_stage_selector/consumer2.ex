alias Experimental.{GenStage}

defmodule Consumer2 do
  use GenStage

  def start_link() do
    GenStage.start_link(__MODULE__, :ok)
  end

  # Callbacks

  def init(:ok) do
    {:consumer, :ok, subscribe_to: [{Broadcaster, selector: &filter/1}]}
  end

  def handle_events(_events, _from, state) do
    {:noreply, [], state}
  end

  defp filter(_e) do
    false
  end
end
