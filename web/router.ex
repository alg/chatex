defmodule Chatex.Router do
  use Phoenix.Router
  use Phoenix.Router.Socket, mount: "/ws"

  channel "messages", Chatex.MessagesChannel

  pipeline :browser do
    plug :accepts, ~w(html)
    plug :fetch_session
  end

  scope "/", Chatex do
    pipe_through :browser

    get "/",    RoomsController, :show, as: :lobby
    get "/:id", RoomsController, :show, as: :room
    post "/message/:room_id", MessagesController, :create, as: :new_message
  end

end
