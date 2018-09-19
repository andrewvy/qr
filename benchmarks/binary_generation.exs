random_ints = Stream.repeatedly(fn() -> Enum.random(0..255) end)

fun = fn(_) ->
  binary =
    random_ints
    |> Enum.take(Enum.random(0..255))
    |> IO.iodata_to_binary()

  QR.to_binary(binary)
end

Benchee.run(%{
  "to_binary" => fn(input) ->
    input |> Enum.each(fun)
  end
}, inputs: %{
  "1" => [1],
  "100" => 1..100,
  "1000" => 1..1000,
})
