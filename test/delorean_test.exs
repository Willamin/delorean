defmodule DeloreanTest do
  use ExUnit.Case
  doctest Delorean

  test "that we can go to yesterday" do
    today = ~D[2016-08-25]
    yesterday = ~D[2016-08-24]
    assert yesterday == Delorean.travel!(today, day: -1)
  end

  test "that we can go to a month ago" do
    today = ~D[2016-08-25]
    last_month = ~D[2016-07-25]
    assert last_month == Delorean.travel!(today, month: -1)
  end

  test "that we can go to a year ago" do
    today = ~D[2016-08-25]
    last_year = ~D[2015-08-25]
    assert last_year == Delorean.travel!(today, year: -1)
  end

  test "that we can go to tomorrow" do
    today = ~D[2016-08-25]
    tomorrow = ~D[2016-08-26]
    assert tomorrow == Delorean.travel!(today, day: 1)
  end

  test "that we can go to a month from now" do
    today = ~D[2016-08-25]
    next_month = ~D[2016-09-25]
    assert next_month == Delorean.travel!(today, month: 1)
  end

  test "that we can go to a year from now" do
    today = ~D[2016-08-25]
    next_year = ~D[2017-08-25]
    assert next_year == Delorean.travel!(today, year: 1)
  end
end
