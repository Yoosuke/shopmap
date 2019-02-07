defmodule ShopmapWeb.PageController do
  use ShopmapWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def mylocation(conn, _params) do
    render(conn, "mylocation.html")
  end

end
