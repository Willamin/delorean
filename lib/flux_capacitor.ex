defmodule FluxCapacitor do

  def cascade(date, changes \\ {0, 0, 0}) do
    if invalid? date do
      if (date |> elem(1) |> valid_month?) do
        cascade(
          add_tuples(date, {0, 0, -1}),
          add_tuples(changes, {0, 0, 1})
        )
      else
        cascade(
          add_tuples(date, {1, -12, 0}),
          changes
        )
      end
    else
      if changes == {0, 0, 0} do
        date
      else
        if ceiling_day? date do
          cascade(
            date
            |> add_tuples({0, 1, 0})
            |> put_elem(2, 1),
            add_tuples(changes, {0, 0, -1})
          )
        else
          cascade(
            add_tuples(date, {0, 0, 1}),
            add_tuples(changes, {0, 0, -1})
          )
        end
      end
    end
  end

  # have we reached the ceiling of days in this particular month?
  def ceiling_day?(date) do
    invalid? add_tuples date, {0, 0, 1}
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


end
