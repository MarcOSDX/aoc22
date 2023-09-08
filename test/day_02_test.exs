defmodule Day02Test do
  use ExUnit.Case

  defp elf_strategy_guide do
    Day02.new_elf_strategy_guide("input/day_02.example")
  end

  test "test_simulate_elf_strategy_guide" do
    fake_input = elf_strategy_guide()
    fake_result = 15

    assert Day02.simulate_elf_strategy_guide(fake_input) == fake_result
  end

  test "test_simulate_elf_strategy_guide_with_new_simulation_core" do
    fake_input = elf_strategy_guide()
    fake_result = 12

    assert Day02.simulate_elf_strategy_guide(fake_input, &Day02.new_simulation_elf_game_core/1) ==
             fake_result
  end
end
