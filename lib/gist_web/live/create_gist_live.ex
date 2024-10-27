defmodule GistWeb.CreateGistLive do
  use GistWeb, :live_view
  alias Gist.{CodeGists, CodeGists.CodeGist}

  def mount(_params, _session, socket) do
    socket =
      assign(
        socket,
        form: to_form(CodeGists.change_code_gist(%CodeGist{}))
      )

    {:ok, socket}
  end

  # def render(assigns)do
  #   ~H"""

  #   """
  # end
end
