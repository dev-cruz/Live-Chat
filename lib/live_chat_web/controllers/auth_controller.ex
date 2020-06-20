defmodule LiveChatWeb.AuthController do
  use LiveChatWeb, :controller

  alias LiveChat.Accounts.User
  alias LiveChat.Accounts

  import Phoenix.LiveView.Controller

  def callback(%{assigns: %{ueberauth_auth: auth}} = conn, params) do
    user = %{
      token: auth.credentials.token,
      email: auth.info.email,
      name: auth.info.nickname,
      image: auth.info.image
    }

    signin(conn, user)
  end

  def signout(conn, _params) do
    conn
    |> configure_session(drop: true)
    |> redirect(to: Routes.home_path(conn, :index))
  end

  defp signin(conn, user_params) do
    case insert_or_update(user_params) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "Welcome #{user.name}!")
        |> put_session(:user, user)
        |> redirect(to: "/")

      {:error, reason} ->
        conn
        |> put_flash(:error, "Error signing in")
        |> redirect(to: Routes.home_path(conn, :index))
    end
  end

  defp insert_or_update(user_params) do
    case Accounts.get_user_by_email(user_params[:email]) do
      nil ->
        Accounts.create_user(user_params)
      user ->
        {:ok, user}
    end
  end
end
