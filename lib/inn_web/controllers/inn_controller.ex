defmodule InnWeb.InnController do
  use InnWeb, :controller
  alias InnWeb.Helpers.Correctnes, as: Correctnes

  def index(conn, %{"inn" => value}) do
    is_valid? = Correctnes.is_valid_inn?(value)
    json(conn, %{value => is_valid?})
  end
end
