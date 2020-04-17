defmodule Utility do
  def present?(self) do
    cond do
      is_float(self) -> true
      is_number(self) -> true
      is_atom(self) -> !is_nil?(self)
      is_boolean(self) -> self != false
      is_binary(self) -> !string_blank?(self)
      is_function(self) -> !is_nil?(self)
      is_list(self) -> !Enum.empty?(self)
      is_tuple(self) -> tuple_size(self) > 0
      is_map(self) -> !Enum.empty?(self)
    end
  end

  def blank?(self) do
    !present?(self)
  end

  def is_nil?(self) do
    self == nil
  end

  def typeof(self) do
    cond do
      is_float(self) -> "float"
      is_number(self) -> "number"
      is_atom(self) -> "atom"
      is_boolean(self) -> "boolean"
      is_binary(self) -> "binary"
      is_function(self) -> "function"
      is_list(self) -> "list"
      is_tuple(self) -> "tuple"
      true -> "idunno"
    end
  end

  def string_blank?(str) do

    case str do
      nil -> true
      "" -> true
      " " <> r -> string_blank?(r)
      _ -> false
    end
  end

  def string_present?(str) do

    case str do
      nil -> false
      "" -> false
      " " <> r -> string_present?(r)
      _ -> true
    end
  end

  def to_i(self) do
    cond do
      blank?(self) -> 0
      is_float(self) -> Kernel.trunc(self)
      is_number(self) -> self
      is_binary(self) -> integer_parse(self)
    end
  end

  def to_f(self) do
    cond do
      blank?(self) -> 0.0
      is_float(self) -> self
      is_number(self) -> self / 1
      is_binary(self) -> float_parse(self)
    end
  end

  def integer_parse(self) do
    IO.inspect(self)
    {number, _char} = Integer.parse(self)
    number
  end

  def float_parse(self) do
    {number, _char} = Float.parse(self)
    number
  end
end
