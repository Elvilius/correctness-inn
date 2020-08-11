defmodule Inn.Repo.Migrations.Users do
  use Ecto.Migration

  def change do
    create table("users") do
      add :id, :serial, primary_key: true,
      add :ip, :string
      add :role, :string
      add :login, :string
      add :password :string
      timestamps()
    end
  end
end
