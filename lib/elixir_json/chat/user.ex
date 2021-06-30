defmodule ElixirJson.Chat.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :firstname, :string
    field :lastname, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:firstname, :lastname, :email])
    |> validate_required([:firstname, :lastname, :email])
  end
end
