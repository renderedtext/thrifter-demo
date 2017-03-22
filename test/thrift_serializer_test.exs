defmodule ThrifterSerializer.Test do
  use ExUnit.Case

  test "serialization" do
    c = ThrifterDemoGeneratedClient.Model.Complex.new(r: 1, i: 0)
    enc = ThrifterDemoGeneratedClient.Model.encode(c)
    assert enc == {:ok, <<6, 0, 1, 0, 1, 6, 0, 2, 0, 0, 0>>}
  end
end
