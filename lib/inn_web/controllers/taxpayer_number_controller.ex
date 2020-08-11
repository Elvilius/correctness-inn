defmodule InnWeb.TaxpayerNumberController do
  use InnWeb, :controller

  alias Inn.Taxpayer
  alias Inn.Taxpayer.TaxpayerNumber

  def index(conn, _params) do
    taxpayer_number = Taxpayer.list_taxpayer_number()
    render(conn, "index.html", taxpayer_number: taxpayer_number)
  end

  def new(conn, _params) do
    changeset = Taxpayer.change_taxpayer_number(%TaxpayerNumber{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"taxpayer_number" => taxpayer_number_params}) do
    case Taxpayer.create_taxpayer_number(taxpayer_number_params) do
      {:ok, taxpayer_number} ->
        conn
        |> put_flash(:info, "Taxpayer number created successfully.")
        |> redirect(to: Routes.taxpayer_number_path(conn, :show, taxpayer_number))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    taxpayer_number = Taxpayer.get_taxpayer_number!(id)
    render(conn, "show.html", taxpayer_number: taxpayer_number)
  end

  def edit(conn, %{"id" => id}) do
    taxpayer_number = Taxpayer.get_taxpayer_number!(id)
    changeset = Taxpayer.change_taxpayer_number(taxpayer_number)
    render(conn, "edit.html", taxpayer_number: taxpayer_number, changeset: changeset)
  end

  def update(conn, %{"id" => id, "taxpayer_number" => taxpayer_number_params}) do
    taxpayer_number = Taxpayer.get_taxpayer_number!(id)

    case Taxpayer.update_taxpayer_number(taxpayer_number, taxpayer_number_params) do
      {:ok, taxpayer_number} ->
        conn
        |> put_flash(:info, "Taxpayer number updated successfully.")
        |> redirect(to: Routes.taxpayer_number_path(conn, :show, taxpayer_number))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", taxpayer_number: taxpayer_number, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    taxpayer_number = Taxpayer.get_taxpayer_number!(id)
    {:ok, _taxpayer_number} = Taxpayer.delete_taxpayer_number(taxpayer_number)

    conn
    |> put_flash(:info, "Taxpayer number deleted successfully.")
    |> redirect(to: Routes.taxpayer_number_path(conn, :index))
  end
end
