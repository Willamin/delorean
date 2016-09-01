defmodule FluxCapacitor do

  def cascade_forward(date, changes \\ {0, 0, 0}) do
    debug(date, changes, "for")
    if invalid? date do
      if (date |> elem(1) |> valid_month?) do
        cascade_forward(
          add_tuples(date, {0, 0, -1}),
          add_tuples(changes, {0, 0, 1})
        )
      else
        cascade_forward(
          add_tuples(date, {1, -12, 0}),
          changes
        )
      end
    else
      if changes == {0, 0, 0} do
        date
      else
        if ceiling_day? date do
          cascade_forward(
            date
            |> add_tuples({0, 1, 0})
            |> put_elem(2, 1),
            add_tuples(changes, {0, 0, -1})
          )
        else
          cascade_forward(
            add_tuples(date, {0, 0, 1}),
            add_tuples(changes, {0, 0, -1})
          )
        end
      end
    end
  end

  def cascade_backward(date, changes \\ {0, 0, 0}) do
    debug(date, changes, "back")
    if invalid? date do
      if (date |> elem(1) |> valid_month?) do
        cascade_backward(
          add_tuples(date, {0, 0, 1}),
          add_tuples(changes, {0, 0, -1})
        )
      else
        cascade_backward(
          add_tuples(date, {-1, +12, 30}),
          changes
        )
      end
    else
      if changes == {0, 0, 0} do
        date
      else
        if floor_day? date do
          new_date =
            date
            |> add_tuples({0, -1, 0})
          cascade_backward(
            new_date
            |> put_elem(2, (last_day_of_month(new_date))),
            add_tuples(changes, {0, 0, 1})
          )
        else
          cascade_backward(
            add_tuples(date, {0, 0, -1}),
            add_tuples(changes, {0, 0, 1})
          )
        end
      end
    end
  end

  # have we reached the ceiling of days in this particular month?
  def ceiling_day?(date) do
    invalid? add_tuples date, {0, 0, 1}
  end

  # have we reached the ceiling of days in this particular month?
  def floor_day?(date) do
    invalid? add_tuples date, {0, 0, -1}
  end

  def last_day_of_month(date, attempt \\ 1) do
    trial_date = date |> put_elem(2, attempt)
    if ceiling_day? trial_date do
      attempt
    else
      last_day_of_month(date, attempt + 1)
    end
  end

  def invalid?(date) do
    case Date.from_erl(date) do
      {:error, _} -> true
      {:ok, _}    -> false
    end
  end

  def valid_month?(month) do
    Enum.member?(1..12, month)
  end

  # add_tuples {5, 10, 20}, {1, 2, 3} == {6, 12, 23}
  def add_tuples(tuple1, tuple2) do
    if tuple_size(tuple1) != tuple_size(tuple2) do
      raise ArgumentError, message: "invalid tuple size"
    end
    list1 = tuple1 |> Tuple.to_list
    list2 = tuple2 |> Tuple.to_list
    List.zip([list1, list2]) |> Enum.map(fn(x) ->
      elem(x,0) + elem(x,1)
    end)
    |> List.to_tuple
  end

  def debug(date, changes, extra \\ "", output \\ false) do
    if output do
      IO.write "[DEBUG]: "
      IO.write inspect(date)
      IO.write "..."
      IO.write inspect(changes)
      if String.length(extra) > 0 do
        IO.write "..." <> extra
      end
      IO.puts ""
      Process.sleep(50)
    end
  end

end
