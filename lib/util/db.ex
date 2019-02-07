defmodule Db do

  def query(sql) do
   case Ecto.Adapters.SQL.query( Shopmap.Repo , sql, [] ) do
    {:ok, struct } -> struct
    {:error, _struct } -> "SQL ERROR!"
   end
  end

  def getmap(result) do
    Enum.map(result.rows,fn row -> map(result.columns, row) end)
  end

  defp map(col, row) do
    List.zip([col, row])
    |> Enum.into(%{})
  end

end
