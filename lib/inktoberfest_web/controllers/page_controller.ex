defmodule InktoberfestWeb.PageController do
  use InktoberfestWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
