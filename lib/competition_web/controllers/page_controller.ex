defmodule CompetitionWeb.PageController do
  use CompetitionWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
