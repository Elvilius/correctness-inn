defmodule InnWeb.TaxpayerNumberControllerTest do
  use InnWeb.ConnCase

  alias Inn.Taxpayer

  @create_attrs %{inn: "some inn", is_correct: true, user_id: 42}
  @update_attrs %{inn: "some updated inn", is_correct: false, user_id: 43}
  @invalid_attrs %{inn: nil, is_correct: nil, user_id: nil}

  def fixture(:taxpayer_number) do
    {:ok, taxpayer_number} = Taxpayer.create_taxpayer_number(@create_attrs)
    taxpayer_number
  end

  describe "index" do
    test "lists all taxpayer_number", %{conn: conn} do
      conn = get(conn, Routes.taxpayer_number_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Taxpayer number"
    end
  end

  describe "new taxpayer_number" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.taxpayer_number_path(conn, :new))
      assert html_response(conn, 200) =~ "New Taxpayer number"
    end
  end

  describe "create taxpayer_number" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.taxpayer_number_path(conn, :create), taxpayer_number: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.taxpayer_number_path(conn, :show, id)

      conn = get(conn, Routes.taxpayer_number_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Taxpayer number"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.taxpayer_number_path(conn, :create), taxpayer_number: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Taxpayer number"
    end
  end

  describe "edit taxpayer_number" do
    setup [:create_taxpayer_number]

    test "renders form for editing chosen taxpayer_number", %{conn: conn, taxpayer_number: taxpayer_number} do
      conn = get(conn, Routes.taxpayer_number_path(conn, :edit, taxpayer_number))
      assert html_response(conn, 200) =~ "Edit Taxpayer number"
    end
  end

  describe "update taxpayer_number" do
    setup [:create_taxpayer_number]

    test "redirects when data is valid", %{conn: conn, taxpayer_number: taxpayer_number} do
      conn = put(conn, Routes.taxpayer_number_path(conn, :update, taxpayer_number), taxpayer_number: @update_attrs)
      assert redirected_to(conn) == Routes.taxpayer_number_path(conn, :show, taxpayer_number)

      conn = get(conn, Routes.taxpayer_number_path(conn, :show, taxpayer_number))
      assert html_response(conn, 200) =~ "some updated inn"
    end

    test "renders errors when data is invalid", %{conn: conn, taxpayer_number: taxpayer_number} do
      conn = put(conn, Routes.taxpayer_number_path(conn, :update, taxpayer_number), taxpayer_number: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Taxpayer number"
    end
  end

  describe "delete taxpayer_number" do
    setup [:create_taxpayer_number]

    test "deletes chosen taxpayer_number", %{conn: conn, taxpayer_number: taxpayer_number} do
      conn = delete(conn, Routes.taxpayer_number_path(conn, :delete, taxpayer_number))
      assert redirected_to(conn) == Routes.taxpayer_number_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.taxpayer_number_path(conn, :show, taxpayer_number))
      end
    end
  end

  defp create_taxpayer_number(_) do
    taxpayer_number = fixture(:taxpayer_number)
    {:ok, taxpayer_number: taxpayer_number}
  end
end
