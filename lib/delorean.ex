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
end
