defmodule Competition.Entries.Entry do
  use Ecto.Schema
  import Ecto.Changeset
  alias Competition.Accounts.User
  alias Competition.Entries.Like
  alias Competition.Entries.Comment
  alias Competition.Entries.Achievement

  schema "entries" do
    field :distance, :integer
    field :time, :integer
    field :stroke_rate, :integer
    field :user_weight, :float
    field :user_height, :integer
    field :completed_at, :naive_datetime
    field :max_hr, :integer
    field :avg_hr, :integer
    belongs_to :user, User
    has_many :likes, Like
    has_many :comments, Comment
    has_one :achievement, Achievement

    timestamps()
  end

  @doc false
  @required_fields ~w(distance time stroke_rate completed_at user_id user_weight user_height)a
  @optional_fields ~w(max_hr avg_hr)a
  def changeset(entries, attrs) do
    entries
    |> cast(attrs, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
  end
end
