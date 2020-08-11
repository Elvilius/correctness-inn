defmodule Inn.Taxpayer.TaxpayerNumber do
  use Ecto.Schema
  import Ecto.Changeset

  schema "taxpayer_number" do
    field :inn, :string
    field :is_correct, :boolean, default: false
    field :user_id, :integer

    timestamps()
  end

  @doc false
  def changeset(taxpayer_number, attrs) do
    taxpayer_number
    |> cast(attrs, [:user_id, :inn, :is_correct])
    |> validate_required([:user_id, :inn, :is_correct])
  end
end
