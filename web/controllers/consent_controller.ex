defmodule Exchange.ConsentController do
  use Exchange.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def blue_badge(conn, %{"bearer"=> token}) do
    render conn, "blue_badge.html", error: false
  end

  def blue_badge(conn, _params) do
    render conn, "blue_badge.html", error: true
  end

  def redirecting(conn, _params) do
    render conn, "redirecting.html"
  end

end
