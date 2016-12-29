defmodule Exchange.APIController do
  use Exchange.Web, :controller

  def index(conn, _params) do
    json conn, %{}
  end

  def blue_badge(conn, %{"bearer" => bearer, "consent_token" => token, "data" => data}) do
    json conn, %{
      "success" => true,
      "result" => %{
        "eligibile" => true,
        "confidence" => 0.9,
        "attribute" => "2017-12-15"
      }
    }
  end

  def blue_badge(conn, _params) do
    json conn, %{
      "success" => false,
      "error" => "bearer, consent_token and data are required parameters",
      "result" => %{}
    }
  end

end
