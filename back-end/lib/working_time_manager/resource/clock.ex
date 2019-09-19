defmodule WorkingTimeManager.Resource.Clock do
  use Ecto.Schema
  import Ecto.Changeset

  schema "clocks" do
    field :status, :boolean, default: false
    field :date, :naive_datetime
    field :user, :id

    timestamps()
  end

  @doc false
  def changeset(clock, attrs) do
    clock
    |> cast(attrs, [:date, :status, :user])
    |> validate_required([:date, :status, :user])
  end
end
