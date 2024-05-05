defmodule InsultGeneratorTest do
  use ExUnit.Case
  doctest InsultGenerator

  test "greets the world" do
    assert InsultGenerator.hello() == :world
  end
end
