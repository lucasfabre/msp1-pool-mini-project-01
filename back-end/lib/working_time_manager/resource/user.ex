defmodule WorkingTimeManager.Resource.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :firstname, :string
    field :lastname, :string
    field :email, :string
    field :password, :string
    field :roles, :integer

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [
      :firstname,
      :lastname,
      :email,
      :password,
      :roles
      ])
    |> validate_required([
      :firstname,
      :lastname,
      :email,
      :password,
      :roles
    ])
    |> validate_format(:firstname, ~r/^\w+$/)
    |> validate_format(:lastname, ~r/^\w+$/)
  end
end
