defmodule ThrifterDemo.HttpTransport.Server do
  use ThriftHttpTransport.Server
  alias ThrifterDemo.HttpTransport.Server.Model

  def add(l, r) do
     c = Model.Complex.new(r: l.r + r.r, i: l.i + r.i)
     s = Model.Status.new(success: true, desc: "")
     r = Model.Result.new(status: s, result: c)
  end
end
