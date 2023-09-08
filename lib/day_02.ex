defmodule Day02 do
  def new_elf_strategy_guide(path) do
    File.read!(path)
    |> String.split("\n")
    |> Enum.filter(&(&1 != ""))
    |> Enum.map(fn string ->
      string |> String.split(" ")
    end)
  end

  def simulate_elf_strategy_guide(
        strategy_guide,
        simulation_core \\ &default_simulation_elf_game_core/1
      ) do
    strategy_guide
    |> Enum.map(simulation_core)
    |> Enum.map(&sum_elf_score_by_round_result/1)
    |> Enum.sum()
  end

  def default_simulation_elf_game_core(["A", "Y"]),
    do: {get_elf_score_by_choose("Y"), :win}

  def default_simulation_elf_game_core(["B", "Z"]),
    do: {get_elf_score_by_choose("Z"), :win}

  def default_simulation_elf_game_core(["C", "X"]),
    do: {get_elf_score_by_choose("X"), :win}

  def default_simulation_elf_game_core([elf_opponent, elf]) do
    elf_score = get_elf_score_by_choose(elf)
    elf_opponent_score = get_elf_score_by_choose(elf_opponent)

    if elf_score == elf_opponent_score do
      {elf_score, :draw}
    else
      {elf_score, :lose}
    end
  end

  def new_simulation_elf_game_core([elf_opponent, "Y"]),
    do: {get_elf_score_by_choose(elf_opponent), :draw}

  def new_simulation_elf_game_core([elf_opponent, "Z"]) do
    case elf_opponent do
      "A" -> {get_elf_score_by_choose("Y"), :win}
      "B" -> {get_elf_score_by_choose("Z"), :win}
      "C" -> {get_elf_score_by_choose("X"), :win}
    end
  end

  def new_simulation_elf_game_core([elf_opponent, "X"]) do
    case elf_opponent do
      "A" -> {get_elf_score_by_choose("Z"), :lose}
      "B" -> {get_elf_score_by_choose("X"), :lose}
      "C" -> {get_elf_score_by_choose("Y"), :lose}
    end
  end

  defp sum_elf_score_by_round_result(elf_round_result) do
    case elf_round_result do
      {elf_score, :win} -> elf_score + 6
      {elf_score, :draw} -> elf_score + 3
      {elf_score, :lose} -> elf_score
    end
  end

  defp get_elf_score_by_choose(choose) do
    case choose do
      "A" -> 1
      "B" -> 2
      "C" -> 3
      "X" -> 1
      "Y" -> 2
      "Z" -> 3
    end
  end
end
