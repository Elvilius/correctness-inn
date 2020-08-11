defmodule Inn.Repo.Migrations.AddInnTable do
  use Ecto.Migration

  def change do
    create table("inn") do
      add :inn, :integer
      add :user_id, :integer,references: "users"
      add :is_сorrect, :boolean
      timestamps()
    end
  end
end
