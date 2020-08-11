defmodule Inn.TaxpayerTest do
  use Inn.DataCase

  alias Inn.Taxpayer

  describe "taxpayer_number" do
    alias Inn.Taxpayer.TaxpayerNumber

    @valid_attrs %{inn: "some inn", is_correct: true, user_id: 42}
    @update_attrs %{inn: "some updated inn", is_correct: false, user_id: 43}
    @invalid_attrs %{inn: nil, is_correct: nil, user_id: nil}

    def taxpayer_number_fixture(attrs \\ %{}) do
      {:ok, taxpayer_number} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Taxpayer.create_taxpayer_number()

      taxpayer_number
    end

    test "list_taxpayer_number/0 returns all taxpayer_number" do
      taxpayer_number = taxpayer_number_fixture()
      assert Taxpayer.list_taxpayer_number() == [taxpayer_number]
    end

    test "get_taxpayer_number!/1 returns the taxpayer_number with given id" do
      taxpayer_number = taxpayer_number_fixture()
      assert Taxpayer.get_taxpayer_number!(taxpayer_number.id) == taxpayer_number
    end

    test "create_taxpayer_number/1 with valid data creates a taxpayer_number" do
      assert {:ok, %TaxpayerNumber{} = taxpayer_number} = Taxpayer.create_taxpayer_number(@valid_attrs)
      assert taxpayer_number.inn == "some inn"
      assert taxpayer_number.is_correct == true
      assert taxpayer_number.user_id == 42
    end

    test "create_taxpayer_number/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Taxpayer.create_taxpayer_number(@invalid_attrs)
    end

    test "update_taxpayer_number/2 with valid data updates the taxpayer_number" do
      taxpayer_number = taxpayer_number_fixture()
      assert {:ok, %TaxpayerNumber{} = taxpayer_number} = Taxpayer.update_taxpayer_number(taxpayer_number, @update_attrs)
      assert taxpayer_number.inn == "some updated inn"
      assert taxpayer_number.is_correct == false
      assert taxpayer_number.user_id == 43
    end

    test "update_taxpayer_number/2 with invalid data returns error changeset" do
      taxpayer_number = taxpayer_number_fixture()
      assert {:error, %Ecto.Changeset{}} = Taxpayer.update_taxpayer_number(taxpayer_number, @invalid_attrs)
      assert taxpayer_number == Taxpayer.get_taxpayer_number!(taxpayer_number.id)
    end

    test "delete_taxpayer_number/1 deletes the taxpayer_number" do
      taxpayer_number = taxpayer_number_fixture()
      assert {:ok, %TaxpayerNumber{}} = Taxpayer.delete_taxpayer_number(taxpayer_number)
      assert_raise Ecto.NoResultsError, fn -> Taxpayer.get_taxpayer_number!(taxpayer_number.id) end
    end

    test "change_taxpayer_number/1 returns a taxpayer_number changeset" do
      taxpayer_number = taxpayer_number_fixture()
      assert %Ecto.Changeset{} = Taxpayer.change_taxpayer_number(taxpayer_number)
    end
  end
end
