defmodule LiveChatWeb.PageLive do
  use LiveChatWeb, :live_view

  @impl true
  def mount(_params, %{"user" => user}, socket) do
    socket = assign(socket, query: "", results: %{}, user: user, num: 0)
    IO.puts connected?(socket)
    {:ok, socket}
  end

  @impl true
  def handle_event("suggest", %{"q" => query}, socket) do
    {:noreply, assign(socket, results: search(query), query: query)}
  end

  @impl true
  def handle_event("search", %{"q" => query}, socket) do
    case search(query) do
      %{^query => vsn} ->
        {:noreply, redirect(socket, external: "https://hexdocs.pm/#{query}/#{vsn}")}

      _ ->
        {:noreply,
         socket
         |> put_flash(:error, "No dependencies found matching \"#{query}\"")
         |> assign(results: %{}, query: query)}
    end
  end

  def handle_event("add", _value, socket) do
    new_num = socket.assigns.num + 1

    socket = assign(socket, num: new_num)
    {:noreply, socket}
  end

  defp search(query) do
    if not LiveChatWeb.Endpoint.config(:code_reloader) do
      raise "action disabled when not in development"
    end

    for {app, desc, vsn} <- Application.started_applications(),
        app = to_string(app),
        String.starts_with?(app, query) and not List.starts_with?(desc, ~c"ERTS"),
        into: %{},
        do: {app, vsn}
  end
end
