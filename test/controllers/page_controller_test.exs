defmodule Exchange.PageControllerTest do
  use Exchange.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "You must create an account to use this service"
  end
end
