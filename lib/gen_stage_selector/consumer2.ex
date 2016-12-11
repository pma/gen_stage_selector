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

  def handle_events(events, _from, state) do
    for event <- events do
      IO.inspect {Consumer2, self(), event}
    end
    {:noreply, [], state}
  end

  defp filter(_), do: false
end
