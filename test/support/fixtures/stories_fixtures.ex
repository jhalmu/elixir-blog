defmodule Blog.StoriesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Blog.Stories` context.
  """

  @doc """
  Generate a story.
  """
  def story_fixture(attrs \\ %{}) do
    {:ok, story} =
      attrs
      |> Enum.into(%{
        body: "some body",
        title: "some title"
      })
      |> Blog.Stories.create_story()

    story
  end
end
