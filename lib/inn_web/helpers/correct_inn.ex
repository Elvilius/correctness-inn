defmodule InnWeb.Helpers.Correctnes do
  def is_valid_inn?(inn),
    do:
      inn
      |> String.codepoints()
      |> Enum.map(fn i -> String.to_integer(i) end)
      |> is_valid?

  def is_valid?(inn_list) when is_list(inn_list) and length(inn_list) == 12 do
    control_sum1 = get_contrlol_sum(inn_list, [7, 2, 4, 10, 3, 5, 9, 4, 6, 8, 0])
    control_sum2 = get_contrlol_sum(inn_list, [3, 7, 2, 4, 10, 3, 5, 9, 4, 6, 8, 0])
    index1 = Enum.at(inn_list, 10)
    index2 = Enum.at(inn_list, 11)
    control_sum1 == index1 and control_sum2 == index2
  end

  def is_valid?(inn_list) when is_list(inn_list) and length(inn_list) <= 10 do
    control_sum = get_contrlol_sum(inn_list, [2, 4, 10, 3, 5, 9, 4, 6, 8, 0])
    List.last(inn_list) == control_sum
  end

  def get_contrlol_sum(inn, coefficient) do
    sum =
      inn
      |> Enum.zip(coefficient)
      |> Enum.map(fn {x, y} -> x * y end)
      |> Enum.sum()
      |> rem(11)

    if sum >= 10 do
      rem(sum, 10)
    else
      sum
    end
  end
end
