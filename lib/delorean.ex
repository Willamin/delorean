defmodule Delorean do
  def travel(present, day: day) do
    Date.new(present.year, present.month, present.day + day)
  end

  def travel(present, month: month) do
    Date.new(present.year, present.month + month, present.day)
  end

  def travel(present, year: year) do
    Date.new(present.year + year, present.month, present.day)
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
