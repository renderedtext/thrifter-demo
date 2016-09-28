defmodule ThrifterDemo.RequestHandler do

  def add(a, b), do: %{r: a.r + b.r, i: a.i + b.i} |> response

  def sub(a, b), do: %{r: a.r - b.r, i: a.i - b.i} |> response

  def response(result_) do
    result = ThrifterDemo.Model.Complex.new(result_)
    status = ThrifterDemo.Model.Status.new(%{success: true})
    ThrifterDemo.Model.Result.new(%{status: status, result: result})
  end

end
