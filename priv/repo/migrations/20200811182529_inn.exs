defmodule Inn.Repo.Migrations.Inn do
  use Ecto.Migration

  def change do
    create table("inn") do
      add :inn, :integer,
      add :userId, :string :references(:users)
      add :is_сorrect, :booleam
      timestamps()
    end
  end
end
