defmodule HackDayApi.Guardian do
  use Guardian, otp_app: :hack_day_api

  def subject_for_token(user, _claims) do
    {:ok, to_string(user.id)}
  end

  def resource_from_claims(claims), do: {:ok, HackDayApi.Account.get_users(claims["user_id"])}
end
