defmodule HackDayApiWeb.LoginView do
  use HackDayApiWeb, :view

  def render("login.json", %{token: token, user_id: user_id}) do
    %{
      user_id: user_id,
      token: token
    }
  end

  def render("login_error.json", %{error: error}) do
    %{
      error: error
    }
  end
end
