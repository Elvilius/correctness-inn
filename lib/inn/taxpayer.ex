defmodule Inn.Taxpayer do
  @moduledoc """
  The Taxpayer context.
  """

  import Ecto.Query, warn: false
  alias Inn.Repo

  alias Inn.Taxpayer.TaxpayerNumber

  @doc """
  Returns the list of taxpayer_number.

  ## Examples

      iex> list_taxpayer_number()
      [%TaxpayerNumber{}, ...]

  """
  def list_taxpayer_number do
    Repo.all(TaxpayerNumber)
  end

  @doc """
  Gets a single taxpayer_number.

  Raises `Ecto.NoResultsError` if the Taxpayer number does not exist.

  ## Examples

      iex> get_taxpayer_number!(123)
      %TaxpayerNumber{}

      iex> get_taxpayer_number!(456)
      ** (Ecto.NoResultsError)

  """
  def get_taxpayer_number!(id), do: Repo.get!(TaxpayerNumber, id)

  @doc """
  Creates a taxpayer_number.

  ## Examples

      iex> create_taxpayer_number(%{field: value})
      {:ok, %TaxpayerNumber{}}

      iex> create_taxpayer_number(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_taxpayer_number(attrs \\ %{}) do
    %TaxpayerNumber{}
    |> TaxpayerNumber.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a taxpayer_number.

  ## Examples

      iex> update_taxpayer_number(taxpayer_number, %{field: new_value})
      {:ok, %TaxpayerNumber{}}

      iex> update_taxpayer_number(taxpayer_number, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_taxpayer_number(%TaxpayerNumber{} = taxpayer_number, attrs) do
    taxpayer_number
    |> TaxpayerNumber.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a taxpayer_number.

  ## Examples

      iex> delete_taxpayer_number(taxpayer_number)
      {:ok, %TaxpayerNumber{}}

      iex> delete_taxpayer_number(taxpayer_number)
      {:error, %Ecto.Changeset{}}

  """
  def delete_taxpayer_number(%TaxpayerNumber{} = taxpayer_number) do
    Repo.delete(taxpayer_number)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking taxpayer_number changes.

  ## Examples

      iex> change_taxpayer_number(taxpayer_number)
      %Ecto.Changeset{source: %TaxpayerNumber{}}

  """
  def change_taxpayer_number(%TaxpayerNumber{} = taxpayer_number) do
    TaxpayerNumber.changeset(taxpayer_number, %{})
  end
end
