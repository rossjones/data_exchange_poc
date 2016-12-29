defmodule Exchange.ClientTest do
  use ExUnit.Case

  alias Exchange.Client

  test "validates token ok" do
    assert Client.validate_token("1234") == true
    assert Client.validate_token("4321") == true
  end

  test "doesn't validates bad tokens " do
    assert Client.validate_token("") == false
    assert Client.validate_token("5678") == false
  end

end
