defmodule Competition.AccountsTest do
  use Competition.DataCase

  alias Competition.Accounts

  describe "users" do
    alias Competition.Accounts.User

    @valid_attrs %{dob: ~N[2010-04-17 14:00:00], email: "some email", firstName: "some firstName", lastName: "some lastName", password_hash: "some password_hash", username: "some username", war_cry: "some war_cry"}
    @update_attrs %{dob: ~N[2011-05-18 15:01:01], email: "some updated email", firstName: "some updated firstName", lastName: "some updated lastName", password_hash: "some updated password_hash", username: "some updated username", war_cry: "some updated war_cry"}
    @invalid_attrs %{dob: nil, email: nil, firstName: nil, lastName: nil, password_hash: nil, username: nil, war_cry: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Accounts.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Accounts.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Accounts.create_user(@valid_attrs)
      assert user.dob == ~N[2010-04-17 14:00:00]
      assert user.email == "some email"
      assert user.firstName == "some firstName"
      assert user.lastName == "some lastName"
      assert user.password_hash == "some password_hash"
      assert user.username == "some username"
      assert user.war_cry == "some war_cry"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = Accounts.update_user(user, @update_attrs)
      assert user.dob == ~N[2011-05-18 15:01:01]
      assert user.email == "some updated email"
      assert user.firstName == "some updated firstName"
      assert user.lastName == "some updated lastName"
      assert user.password_hash == "some updated password_hash"
      assert user.username == "some updated username"
      assert user.war_cry == "some updated war_cry"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, @invalid_attrs)
      assert user == Accounts.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Accounts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user(user)
    end
  end
end
