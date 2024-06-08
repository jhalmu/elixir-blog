defmodule Blog.Stories.Story do
  @moduledoc """
  Stories schema for the Blog application.
  """

  use Ecto.Schema
  import Ecto.Changeset

  schema "stories" do
    field :title, :string
    field :body, :string
    belongs_to :user, Blog.Accounts.User

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(story, attrs) do
    story
    |> cast(attrs, [:title, :body, :user_id])
    |> validate_required([:title, :body])
  end
end
