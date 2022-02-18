defmodule LoggerSigilLTest do
  use ExUnit.Case
  use LoggerSigilL
  import LoggerSigilL
  doctest LoggerSigilL

  test "test sigil" do
    ~l"message"d
    assert LoggerSigilL.hello() == :world
  end
end
