defmodule HackDayApiWeb.UsersView do
  use HackDayApiWeb, :view
  alias HackDayApiWeb.UsersView

  def render("index.json", %{users: users}) do
    %{data: render_many(users, UsersView, "users.json")}
  end

  def render("show.json", %{users: users}) do
    %{data: render_one(users, UsersView, "users.json")}
  end

  def render("users.json", %{users: users}) do
    %{
      id: users.id,
      name: users.name,
      email: users.email,
      password: users.password
    }
  end
end
