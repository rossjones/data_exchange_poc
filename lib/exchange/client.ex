defmodule Exchange.Client do

  # Validates a token and will return true if it is okay,
  # or false otherwise.  This is currently hard-coded to
  # use the values in configuration
  def validate_token(token) do
    matches = Application.get_env(:exchange, __MODULE__)[:clients]
    |> Enum.filter(fn x-> x.token == token end)
    length(matches) == 1
  end

end
