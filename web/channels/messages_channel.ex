defmodule Chatex.MessagesChannel do
  use Phoenix.Channel

  @doc "Called when the user connects to the room."
  def join(socket, _room_id, _message) do
    { :ok, socket }
  end

  @doc "Called when the user disconnects."
  def leave(socket, _message) do
    socket
  end

end
