defmodule HackDayApi.Account.Users do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :name, :string
    field :password, :string
    field :age, :integer

    timestamps()
  end

  @doc false
  def changeset(users, attrs) do
    users
    |> cast(attrs, [:name, :email, :password, :age])
    |> validate_required([:name, :email, :password, :age])
  end
end
