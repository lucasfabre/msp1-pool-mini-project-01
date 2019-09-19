defmodule WorkingTimeManager.Clock do
  use Ecto.Schema
  import Ecto.Changeset

  schema "clocks" do
    field :date, :naive_datetime
    field :status, :boolean, default: false
    field :user, :id

    timestamps()
  end

  @doc false
  def changeset(clock, attrs) do
    clock
    |> cast(attrs, [:date, :status])
    |> validate_required([:date, :status])
  end
end
