defmodule Competition.CompsTest do
  use Competition.DataCase

  alias Competition.Comps

  describe "comps" do
    alias Competition.Comps.Comp

    @valid_attrs %{description: "some description", name: "some name"}
    @update_attrs %{description: "some updated description", name: "some updated name"}
    @invalid_attrs %{description: nil, name: nil}

    def comp_fixture(attrs \\ %{}) do
      {:ok, comp} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Comps.create_comp()

      comp
    end

    test "list_comps/0 returns all comps" do
      comp = comp_fixture()
      assert Comps.list_comps() == [comp]
    end

    test "get_comp!/1 returns the comp with given id" do
      comp = comp_fixture()
      assert Comps.get_comp!(comp.id) == comp
    end

    test "create_comp/1 with valid data creates a comp" do
      assert {:ok, %Comp{} = comp} = Comps.create_comp(@valid_attrs)
      assert comp.description == "some description"
      assert comp.name == "some name"
    end

    test "create_comp/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Comps.create_comp(@invalid_attrs)
    end

    test "update_comp/2 with valid data updates the comp" do
      comp = comp_fixture()
      assert {:ok, %Comp{} = comp} = Comps.update_comp(comp, @update_attrs)
      assert comp.description == "some updated description"
      assert comp.name == "some updated name"
    end

    test "update_comp/2 with invalid data returns error changeset" do
      comp = comp_fixture()
      assert {:error, %Ecto.Changeset{}} = Comps.update_comp(comp, @invalid_attrs)
      assert comp == Comps.get_comp!(comp.id)
    end

    test "delete_comp/1 deletes the comp" do
      comp = comp_fixture()
      assert {:ok, %Comp{}} = Comps.delete_comp(comp)
      assert_raise Ecto.NoResultsError, fn -> Comps.get_comp!(comp.id) end
    end

    test "change_comp/1 returns a comp changeset" do
      comp = comp_fixture()
      assert %Ecto.Changeset{} = Comps.change_comp(comp)
    end
  end
end
