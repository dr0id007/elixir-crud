defmodule ElixirJson.ChatTest do
  use ElixirJson.DataCase

  alias ElixirJson.Chat

  describe "users" do
    alias ElixirJson.Chat.User

    @valid_attrs %{email: "some email", firstname: "some firstname", lastname: "some lastname"}
    @update_attrs %{email: "some updated email", firstname: "some updated firstname", lastname: "some updated lastname"}
    @invalid_attrs %{email: nil, firstname: nil, lastname: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Chat.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Chat.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Chat.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Chat.create_user(@valid_attrs)
      assert user.email == "some email"
      assert user.firstname == "some firstname"
      assert user.lastname == "some lastname"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Chat.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = Chat.update_user(user, @update_attrs)
      assert user.email == "some updated email"
      assert user.firstname == "some updated firstname"
      assert user.lastname == "some updated lastname"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Chat.update_user(user, @invalid_attrs)
      assert user == Chat.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Chat.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Chat.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Chat.change_user(user)
    end
  end
end
