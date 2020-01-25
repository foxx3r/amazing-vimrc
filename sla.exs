defmodule Math do
  def sum(a, b), do: a + b
  def multiply(a, b), do: a * b
  def minus(a, b), do: a - b
end

Math.sum(8, 9) #=> 17
IO.puts "Great :)"
