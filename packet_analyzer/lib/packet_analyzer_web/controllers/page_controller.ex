defmodule PacketAnalyzerWeb.PageController do
  use PacketAnalyzerWeb, :controller

  def index(conn, params) do
    render(conn, "index.html", params: params)
  end

end
