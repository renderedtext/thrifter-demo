defmodule Test.ThriftHttpTransport do
  use ExUnit.Case
  alias ThrifterDemoGeneratedClient.HttpClient

  test "serialization" do
    Application.put_env(:thrifter_demo_generated_client, :host, "localhost")
    Application.put_env(:thrifter_demo_generated_client, :port, 2999)
    number        = HttpClient.Model.Complex.new( r: 3, i: 0)
    {:ok, result} = HttpClient.add(number, number)

    assert result.result.r == 6
    assert result.result.i == 0
  end
end
