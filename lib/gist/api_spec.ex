defmodule GistWeb.ApiSpec do
  alias OpenApiSpex.{Components, Info, OpenApi, Paths, Server}
  alias GistWeb.{Endpoint, Router}
  alias Gist.CodeGists.CodeGist

  @behaviour OpenApi

  @impl OpenApi
  def spec do
    %OpenApi{
      servers: [
        Server.from_endpoint(Endpoint)
      ],
      info: %Info{
        title: "Elixir Gist API",
        version: "1.0.0"
      },
      paths: Paths.from_router(Router),
      components: %Components{
        schemas: %{
          Gist: CodeGist
        }
      }
      # components: %Components{
      #   securitySchemes: %{"authorization" => %SecurityScheme{type: "http", scheme: "bearer"}}
      # }
      # swagger_ui_config: %{
      #   "theme" => "dark"
      # }
    }
  end
end
