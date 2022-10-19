defmodule ChatjamesWeb.MetallicafanChannel do
  use ChatjamesWeb, :channel

  alias Chatjames.Chats

@impl true
  def join("metallicafan:lobby", _payload, socket) do
    {:ok, socket}
  end

  # It is also common to receive messages from the client and
  # broadcast to everyone in the current topic (water_cooler:lobby).
@impl true
  def handle_in("shout", payload, socket) do
    Chats.create_message(payload)
    broadcast socket, "shout", payload
    {:noreply, socket}
  end
end
