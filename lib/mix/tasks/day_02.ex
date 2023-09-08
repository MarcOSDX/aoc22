defmodule Mix.Tasks.Day02 do
  use Mix.Task

  def run(_) do
    elf_strategy_guide = Day02.new_elf_strategy_guide("input/day_02.data")
    answer_01 = Day02.simulate_elf_strategy_guide(elf_strategy_guide)

    answer_02 =
      Day02.simulate_elf_strategy_guide(elf_strategy_guide, &Day02.new_simulation_elf_game_core/1)

    IO.puts("Answer 01 is #{answer_01}")
    IO.puts("Answer 01 is #{answer_02}")
  end
end
