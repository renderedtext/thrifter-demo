defmodule Test.ThriftHttpTransport do
  use ExUnit.Case
  alias ThrifterDemoGeneratedClient.HttpClient

  setup_all do
    Application.put_env(:thrifter_demo_generated_client, :host, "localhost")
    Application.put_env(:thrifter_demo_generated_client, :port, 2999)
  end

  test "function call" do
    number        = HttpClient.Model.Complex.new( r: 3, i: 0)
    {:ok, result} = HttpClient.add(number, number)

    assert result.result.r == 6
    assert result.result.i == 0
  end

  test "" do
    {:ok, result} = HttpClient.service_health_check
    assert result.status_code == 200
  end
end
