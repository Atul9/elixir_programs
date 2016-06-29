ExUnit.start
defmodule StringTest do
  use ExUnit.Case

  def sample do
    "elixir"
  end

  test "at" do
    assert String.at(sample, 0) == "e"
    assert String.at(sample, 7) == nil
    assert String.at("", -1) == nil
  end

  test "capitalize" do
    assert String.capitalize("abcd") == "Abcd"
  end

  test "codepoints" do
    assert String.codepoints("elixir") == ["e", "l", "i", "x", "i", "r"]
  end

  test "contains" do
    assert String.contains? "elixir", "xir"
    assert String.contains? "x", ""
  end

  test "length" do
    assert String.length("elixir") == 6
  end

  test "replace" do
    assert String.replace("a,b,c", ",", "-") == "a-b-c"
    assert String.replace("a,b,c", ",", "-", global: false) == "a-b,c"
  end

  test "replace_leading" do
    assert String.replace_leading("hello world", "hello ", "") == "world"
    assert String.replace_leading("hello hello world", "hello ", "") == "world"
    assert String.replace_leading("hello hello world", "hello ", "ola ") == "ola ola world"
  end

  test "replace_prefix" do
    assert String.replace_prefix("world", "hello ", "") == "world"
    assert String.replace_prefix("hello world", "hello", "my") == "my world"
    assert String.replace_suffix("hello world world", " world", "") == "hello world"
    assert String.replace_suffix("hello world world", " world", " mundo") == "hello world mundo"
    assert String.replace_suffix("hello", " world", " mundo") == "hello"
  end

  test "replace_trailing" do
    assert String.replace_trailing("hello world world", " world", "") == "hello"
    assert String.replace_trailing("hello world", " world", "") == "hello"
  end

  test "reverse" do
    assert String.reverse("abcd") == "dcba"
  end

  test "slice" do
    assert String.slice("elixir", 1, 3) == "lix"
    assert String.slice("a", 2, 3) == ""
  end

  # Retruns a list
  test "split" do
    assert String.split("foo bar") == ["foo", "bar"]
  end

  # Returns a tuple
  test "split_at" do
    assert String.split_at("sweetelixir", 5) == {"sweet", "elixir"}
  end

  test "starts_with?" do
    assert String.starts_with?("elixir", "eli") == true
  end

  test "to_integer" do
    assert String.to_integer("123") == 123
  end

  test "trim" do
    assert String.trim("\n  elixir\n  ") == "elixir"
  end

  test "upcase" do
    assert String.upcase("atul") == "ATUL"
  end

  test "valid" do
    assert String.valid?(<<0xFFFF :: 16>>) == false
    assert String.valid?("elixir") == true
  end

  test "last" do
    assert String.last("elixir") == "r"
  end

  test "first" do
    assert String.first("elixir") == "e"
  end
end
