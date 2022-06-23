defmodule HackDayApiWeb.UsersController do
  use HackDayApiWeb, :controller

  alias HackDayApi.Account
  alias HackDayApi.Account.Users

  action_fallback HackDayApiWeb.FallbackController

  def index(conn, _params) do
    users = Account.list_users()
    render(conn, "index.json", users: users)
  end

  def create(conn, %{} = users_params) do
    with {:ok, %Users{} = users} <- Account.create_users(users_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.users_path(conn, :show, users))
      |> render("show.json", users: users)
    end
  end

  def show(conn, %{"id" => id}) do
    users = Account.get_users(id)

    case users != nil do
      true -> render(conn, "show.json", users: users)
      _ -> put_status(conn, :notfound)
    end
  end

  def update(conn, %{"id" => id}) do
    users_params = conn.params
    users = Account.get_users(id)

    with {:ok, %Users{} = users} <- Account.update_users(users, users_params) do
      render(conn, "show.json", users: users)
    end
  end

  def delete(conn, %{"id" => id}) do
    users = Account.get_users(id)

    with {:ok, %Users{}} <- Account.delete_users(users) do
      send_resp(conn, :no_content, "")
    end
  end
end
