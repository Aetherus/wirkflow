defmodule Wirkflow.RunnerTest do
  use ExUnit.Case
  doctest Wirkflow.Runner

  test "greets the world" do
    assert Wirkflow.Runner.hello() == :world
  end
end
