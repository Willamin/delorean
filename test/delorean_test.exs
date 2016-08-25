defmodule DeloreanTest do
  use ExUnit.Case
  doctest Delorean

  test "that we can go to yesterday" do
    assert ~D[1985-10-20] == Delorean.travel!(today, day: -1)
  end

  test "that we can go to a month ago" do
    assert ~D[1985-09-21] == Delorean.travel!(today, month: -1)
  end

  test "that we can go to a year ago" do
    assert ~D[1984-10-21] == Delorean.travel!(today, year: -1)
  end

  test "that we can go to tomorrow" do
    assert ~D[1985-10-22] == Delorean.travel!(today, day: 1)
  end

  test "that we can go to a month from now" do
    assert ~D[1985-11-21] == Delorean.travel!(today, month: 1)
  end

  test "that we can go to a year from now" do
    assert ~D[1986-10-21] == Delorean.travel!(today, year: 1)
  end

  test "that we can go to the past" do
    assert ~D[1955-11-12] == today
    |> Delorean.travel!(year: -30)
    |> Delorean.travel!(month: 1)
    |> Delorean.travel!(day: -9)
  end

  test "that we can compare dates properly" do
    assert Delorean.compare(~D[1955-11-21], ~D[1985-10-12]) == -1
  end

  def today do
    ~D[1985-10-21]
  end
end
