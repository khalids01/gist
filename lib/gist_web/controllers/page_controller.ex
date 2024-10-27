defmodule GistWeb.PageController do
  use GistWeb, :controller
  use OpenApiSpex.ControllerSpecs

  alias Gist.CodeGists
  alias Gist.CodeGists.CodeGist

  tags(["Gists"])

  operation(:index,
    summary: "List All Gists",
    responses: [
      ok: {"Gist list", "application/json", %OpenApiSpex.Schema{type: :array, items: CodeGist}}
    ]
  )

  def index(conn, _params) do
    gists = CodeGists.list_gists()
    json(conn, gists)
  end

  def home(conn, _params) do
    redirect(conn, to: "/create")
  end
end
