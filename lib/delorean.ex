defmodule Delorean do
  import FluxCapacitor

  def travel(present, day: day) when day > 0 do
    cascade_forward({present.year, present.month, present.day + day}) |> Date.from_erl
  end

  def travel(present, month: month) when month > 0 do
    cascade_forward({present.year, present.month + month, present.day}) |> Date.from_erl
  end

  def travel(present, year: year) when year > 0 do
    cascade_forward({present.year + year, present.month, present.day}) |> Date.from_erl
  end

  def travel(present, day: day) when day < 0 do
    cascade_backward({present.year, present.month, present.day + day}) |> Date.from_erl
  end

  def travel(present, month: month) when month < 0 do
    cascade_backward({present.year, present.month + month, present.day}) |> Date.from_erl
  end

  def travel(present, year: year) when year < 0 do
    cascade_backward({present.year + year, present.month, present.day}) |> Date.from_erl
  end

  def travel!(present, opts) do
    {:ok, destination} = travel(present, opts)
    destination
  end

  def compare(date1, date2) do
    with 0 <- compare_map_key(date1, date2, :year),
      0 <- compare_map_key(date1, date2, :month),
      0 <- compare_map_key(date1, date2, :day)
    do
      0
    end
  end

  def compare_map_key(item1, item2, key) do
    a = Map.get(item1, key)
    b = Map.get(item2, key)
    cond do
      a == b -> 0
      a > b -> 1
      a < b -> -1
    end
  end
end
