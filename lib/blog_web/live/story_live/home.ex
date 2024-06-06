defmodule BlogWeb.StoryLive.Home do
  use BlogWeb, :live_view

  alias Blog.Stories

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :stories, Stories.list_stories())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Story")
    |> assign(:story, Stories.get_story!(id, socket.assigns.current_user.id))
  end

  defp apply_action(socket, :home, _params) do
    socket
    |> assign(:page_title, "Listing Stories")
    |> assign(:story, nil)
  end
end
