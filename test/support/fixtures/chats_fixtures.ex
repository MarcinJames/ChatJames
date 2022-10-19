defmodule Chatjames.ChatsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Chatjames.Chats` context.
  """

  @doc """
  Generate a message.
  """
  def message_fixture(attrs \\ %{}) do
    {:ok, message} =
      attrs
      |> Enum.into(%{
        body: "some body",
        name: "some name"
      })
      |> Chatjames.Chats.create_message()

    message
  end
end
