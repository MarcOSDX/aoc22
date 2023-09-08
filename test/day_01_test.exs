defmodule Day01Test do
  use ExUnit.Case

  defp elf_calories do
    Day01.new_elf_calories("input/day_01.example")
  end

  test "total_elf_calories_test" do
    fake_input = elf_calories()
    fake_result = 24_000

    assert Day01.total_elf_calories(fake_input) == fake_result
  end

  test "total_elf_calories_test_with_top_3_elf_calorie" do
    fake_input = elf_calories()
    fake_result = 45_000

    assert Day01.total_elf_calories(fake_input, 3) == fake_result
  end
end
