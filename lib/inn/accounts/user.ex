defmodule Inn.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :ip_address, :string
    field :login, :string
    field :password, :string
    field :role, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:ip_address, :login, :password, :role])
    |> validate_required([:ip_address, :login, :password, :role])
  end
end
