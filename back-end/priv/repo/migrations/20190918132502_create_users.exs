defmodule WorkingTimeManager.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :firstname, :string
      add :lastname, :string
      add :email, :string
      add :password, :string
      add :roles, :integer

      timestamps()
    end

  end
end
