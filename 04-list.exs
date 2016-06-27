ExUnit.start
defmodule ListTest do
  use ExUnit.Case

  def sample do
    ["pencil", "rubber", "pen"]
  end

  test "sigil" do
    assert sample == ~w(pencil rubber pen)
  end

  test "head" do
    # A list also supports matching on its own head and tail
    # if '_' is used then it doesn't assign any value to _
    # it returns an error that its an unbound variable
    [head | _] = sample
    assert head == "pencil"
  end

  test "tail" do
    [_ | tail] = sample
    assert tail == ~w(rubber pen)
  end

  test "pin operator" do
    x = 1
    assert_raise MatchError, fn ->
      ^x = 2
    end
  end

  test "last item" do
    assert List.last(sample) == "pen" # List - Elixir.List
  end

  test "first" do
    assert List.first(sample) == "pencil"
  end

  test "List.fold" do
    list = [20, 10, 30]
    sum = List.foldl(list, 0, &(&1 + &2))
    # or
    # sum = List.foldr list, 0, fn (num, sum) -> num + sum end
    # same like inject in ruby
    assert sum == 60
  end
end
