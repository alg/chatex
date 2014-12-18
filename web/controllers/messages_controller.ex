defmodule Chatex.MessagesController do
  use Phoenix.Controller

  plug :action

  @doc "Broadcasts a message to the members of the #room_id."
  def create(conn, %{ "room_id" => room_id, "message" => %{ "user" => user, "body" => body } }) do
    Phoenix.Channel.broadcast "messages", room_id, "new:message", %{ user: user, body: body }
    conn |> text "ok" 
  end

end
