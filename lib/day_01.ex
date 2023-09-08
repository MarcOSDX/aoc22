defmodule Day01 do
  def new_elf_calories(path) do
    File.read!(path)
    |> String.split("\n\n")
    |> Enum.map(&to_elf_calorie/1)
  end

  def total_elf_calories(elf_calories, top \\ 1) do
    elf_calories
    |> Enum.map(&Enum.sum/1)
    |> Enum.sort(&(&1 >= &2))
    |> Enum.take(top)
    |> Enum.sum()
  end

  defp to_elf_calorie(string) do
    string
    |> String.split("\n")
    |> Enum.filter(&(&1 != ""))
    |> Enum.map(&String.to_integer/1)
  end
end
