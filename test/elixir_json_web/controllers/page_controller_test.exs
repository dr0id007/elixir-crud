defmodule ElixirJsonWeb.PageControllerTest do
  use ElixirJsonWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Chat Example"
  end
end
