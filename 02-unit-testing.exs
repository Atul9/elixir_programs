#http://elixir-lang.org/docs/stable/ex_unit/ExUnit.Assertions.html
ExUnit.start

defmodule MyTest do
  use ExUnit.Case
  test 'simple test' do
    assert 1 + 1  == 2
  end

  test 'refute is opposite of assert' do
    refute 1 + 5 == 2
  end

  test :assert_raise do
    assert_raise ArithmeticError, fn ->
      1 + "atul"
    end
  end

  test 'assert_in_delta Asserts that value1 and value2 differ by no more than delta' do
    assert_in_delta 1, # actual
                    5, # expected
                    6  # delta
  end

  test 'refute_in_delta Asserts that value1 and value2 are not within delta' do
    refute_in_delta 1, # actual
                    5, # expected
                    2  # delta
  end

  #flunk "This should fail"

  #refute true, "This will obviously fail"

  assert 2 > 1
end
