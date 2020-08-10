defmodule InnWeb.PageController do
  use InnWeb, :controller

  def index(conn, _params) do
    IO.inspect(1234555)
    json(conn, %{a: 123123})
  end
end
