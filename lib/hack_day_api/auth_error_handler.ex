defmodule HackDayApi.AuthErrorHandler do
  import Plug.Conn

  def auth_error(conn, {type, _reason}, _opts) do
    error_description =
      case to_string(type) do
        "unauthenticated" -> "unauthenticated_user"
        _ -> to_string(type)
      end

    body = Jason.encode!(%{error: error_description})

    conn
    |> put_resp_content_type("application/json")
    |> send_resp(401, body)
  end
end
