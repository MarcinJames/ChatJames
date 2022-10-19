defmodule ChatjamesWeb.PageController do
  use ChatjamesWeb, :controller

  alias Chatjames.Chats

  @spec index(Plug.Conn.t(), any) :: Plug.Conn.t()
  def index(conn, _params) do
    messages = Chats.list_messages
    render conn, "index.html", messages: messages
  end
end
