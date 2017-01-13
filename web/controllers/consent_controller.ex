defmodule Exchange.ConsentController do
  use Exchange.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  defp get_referer(conn) do
    case List.keyfind(conn.req_headers, "referer", 0) do
      {"referer", referer} ->
        parts = URI.parse(referer)
        "#{parts.scheme}://#{parts.authority}"
      nil ->
        "https://127.0.0.1:9000"
    end
  end

  def blue_badge(conn, %{"bearer"=> token}) do
    get_referer(conn) |> IO.inspect
    render conn, "blue_badge.html", error: false, referer: get_referer(conn), token: "1010101010"
  end

  def blue_badge(conn, _params) do
    render conn, "blue_badge.html", error: true
  end

  def redirecting(conn, _params) do
    render conn, "redirecting.html"
  end

end
