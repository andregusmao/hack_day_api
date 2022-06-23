defmodule HackDayApi.AccountTest do
  use HackDayApi.DataCase

  alias HackDayApi.Account

  describe "users" do
    alias HackDayApi.Account.Users

    import HackDayApi.AccountFixtures

    @invalid_attrs %{email: nil, name: nil, password: nil}

    test "list_users/0 returns all users" do
      users = users_fixture()
      assert Account.list_users() == [users]
    end

    test "get_users!/1 returns the users with given id" do
      users = users_fixture()
      assert Account.get_users!(users.id) == users
    end

    test "create_users/1 with valid data creates a users" do
      valid_attrs = %{email: "some email", name: "some name", password: "some password"}

      assert {:ok, %Users{} = users} = Account.create_users(valid_attrs)
      assert users.email == "some email"
      assert users.name == "some name"
      assert users.password == "some password"
    end

    test "create_users/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Account.create_users(@invalid_attrs)
    end

    test "update_users/2 with valid data updates the users" do
      users = users_fixture()

      update_attrs = %{
        email: "some updated email",
        name: "some updated name",
        password: "some updated password"
      }

      assert {:ok, %Users{} = users} = Account.update_users(users, update_attrs)
      assert users.email == "some updated email"
      assert users.name == "some updated name"
      assert users.password == "some updated password"
    end

    test "update_users/2 with invalid data returns error changeset" do
      users = users_fixture()
      assert {:error, %Ecto.Changeset{}} = Account.update_users(users, @invalid_attrs)
      assert users == Account.get_users!(users.id)
    end

    test "delete_users/1 deletes the users" do
      users = users_fixture()
      assert {:ok, %Users{}} = Account.delete_users(users)
      assert_raise Ecto.NoResultsError, fn -> Account.get_users!(users.id) end
    end

    test "change_users/1 returns a users changeset" do
      users = users_fixture()
      assert %Ecto.Changeset{} = Account.change_users(users)
    end
  end
end
