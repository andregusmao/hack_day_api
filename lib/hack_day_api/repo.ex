defmodule HackDayApi.Repo do
  use Ecto.Repo,
    otp_app: :hack_day_api,
    adapter: Ecto.Adapters.Tds
end
