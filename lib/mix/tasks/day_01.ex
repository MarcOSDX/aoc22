defmodule Mix.Tasks.Day01 do
  use Mix.Task

  def run(_) do
    elf_calories = Day01.new_elf_calories("input/day_01.data")
    answer_01 = Day01.total_elf_calories(elf_calories)
    answer_02 = Day01.total_elf_calories(elf_calories, 3)

    IO.puts("Answer 01: #{answer_01}")
    IO.puts("Answer 02: #{answer_02}")
  end
end
