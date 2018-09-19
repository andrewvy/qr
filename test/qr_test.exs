defmodule QrTest do
  use ExUnit.Case
  doctest Qr

  test "greets the world" do
    assert Qr.hello() == :world
  end
end
