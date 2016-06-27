defmodule FruitInterrogator do
  def get_name do
    # |> is a pipe operator in elixir same as unix | pipe
    IO.gets("What is your name?") |> String.strip
  end

  def get_fruit_lover do
    IO.getn("Do you like fruits? [y][n]", 1)
  end

  def interrogate do
    name = get_name
    case String.downcase(get_fruit_lover) do
      "y" ->
        IO.puts "Great! Here's  a fruit for you #{name}"
        IO.puts "Mango"
      "n" ->
        IO.puts "Thats a shame, #{name}"
      _ ->
        IO.puts "You should have entered 'y' or 'n'"
    end
  end
end

FruitInterrogator.interrogate
