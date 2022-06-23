defmodule HackDayApiWeb.LoginController do
  use HackDayApiWeb, :controller

  alias HackDayApi.Account
  alias HackDayApi.Guardian

  action_fallback(HackDayApiWeb.FallbackController)

  def login(conn, %{"user" => user, "password" => password}) do
    auth = Account.get_login(user, password)

    case auth do
      nil ->
        conn
        |> put_status(:not_found)
        |> render("login_error.json", %{error: "wrong_user_or_password"})

      _ ->
        {:ok, token, _} =
          Guardian.encode_and_sign(auth, %{user_id: auth.id},
            token_type: "refresh",
            ttl: {24, :hours}
          )

        conn
        |> put_status(:ok)
        |> render("login.json", %{
          token: token,
          user_id: auth.id
        })
    end
  end
end
