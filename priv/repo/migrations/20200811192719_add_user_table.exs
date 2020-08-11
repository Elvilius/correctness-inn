defmodule Inn.Repo.Migrations.AddUserTable do
  use Ecto.Migration

  def change do
    create table("user") do
      add :user_id, :serial, primary_key: true
      add :ip_address, :string, size: 40
      add :role, :string, size: 40
      add :login, :varchar
      add :password, :varchar
      timestamps()
    end
  end
end
