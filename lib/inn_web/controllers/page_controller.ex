defmodule InnWeb.PageController do
  use InnWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
