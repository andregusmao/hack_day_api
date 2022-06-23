defmodule HackDayApi.AccountFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `HackDayApi.Account` context.
  """

  @doc """
  Generate a users.
  """
  def users_fixture(attrs \\ %{}) do
    {:ok, users} =
      attrs
      |> Enum.into(%{
        email: "some email",
        name: "some name",
        password: "some password"
      })
      |> HackDayApi.Account.create_users()

    users
  end
end
