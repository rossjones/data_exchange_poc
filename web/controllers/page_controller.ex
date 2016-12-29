defmodule Exchange.PageController do
  use Exchange.Web, :controller

  def index(conn, _params) do
    render conn, "index.html",
      layout: {Exchange.LayoutView, "start.html"}
  end

  def signin(conn, _params) do
    render conn, "signin.html"
  end

  def signin_action(conn, %{"email"=>email, "password"=>password}) do
    render conn, "signin.html"
  end

end
