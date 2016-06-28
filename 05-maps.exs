ExUnit.start
defmodule MapTest do
  use ExUnit.Case

  def sample do
    %{foo: "bar", bar: "foo"}
  end

  test "Map.get" do
    assert Map.get(sample, :foo) == "bar"
  end

  # To delete single key from a map use delete
  test "Map.delete" do
    assert Map.delete(sample, :foo) == %{bar: "foo"}
  end

  # To delete multiple keys from a map use drop
  test "Map.drop" do
    assert Map.drop(sample, [:foo, :bar]) == %{}
  end

  # [] to get the value of the specified key from a map
  test "[]" do
    assert sample[:foo] == "bar"
    assert sample[:non_existent] == nil
  end

  # . is same like []. Used to get the value of the key
  test "." do
    assert sample.foo == "bar"
    assert_raise KeyError, fn ->
      sample.non_existent
    end
  end

  test "Map.fetch" do
    # Always returns {:ok, value} 
    {:ok, val} = Map.fetch(sample, :foo)
    assert val == "bar"
    # If key doesn't exists it returns :error
    assert Map.fetch(sample, :baz) == :error
  end

  test "Map.put" do
    # inserts new value in map
    assert Map.put(sample, :india, "delhi") == %{foo: "bar", bar: "foo",india: "delhi"}
  end

  test "Map.value" do
    # Map does not preserve the value of keys, thus we use Enum.sort
    assert Enum.sort(Map.values(sample)) == ["bar", "foo"]
  end
end
