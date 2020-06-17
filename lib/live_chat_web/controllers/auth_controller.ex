defmodule LiveChatWeb.AuthController do
  use LiveChatWeb, :controller

  def callback(%{assigns: %{ueberauth_auth: auth}} = conn, params) do
    user = %{
      token: auth.credentials.token,
      email: auth.info.email,
      name: auth.info.nickname,
      image: auth.info.image
    }

    IO.inspect user
  end
end
