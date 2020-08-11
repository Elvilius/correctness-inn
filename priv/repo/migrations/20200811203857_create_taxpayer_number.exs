defmodule Inn.Repo.Migrations.CreateTaxpayerNumber do
  use Ecto.Migration

  def change do
    create table(:taxpayer_number) do
      add :user_id, :integer
      add :inn, :string
      add :is_correct, :boolean, default: false, null: false

      timestamps()
    end

  end
end
