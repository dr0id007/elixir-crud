defmodule ElixirJsonWeb.PageController do
  use ElixirJsonWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
