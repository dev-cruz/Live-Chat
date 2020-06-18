defmodule LiveChatWeb.AuthController do
  use LiveChatWeb, :controller

  alias LiveChat.Accounts.User

  def callback(%{assigns: %{ueberauth_auth: auth}} = conn, params) do
    user = %{
      token: auth.credentials.token,
      email: auth.info.email,
      name: auth.info.nickname,
      image: auth.info.image
    }

    changeset = User.changeset(%User{}, user)

    IO.inspect changeset
  end
end
