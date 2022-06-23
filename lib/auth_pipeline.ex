defmodule HackDayApi.Guardian.AuthPipeline do
  use Guardian.Plug.Pipeline,
    otp_app: :hack_day_api,
    module: HackDayApi.Guardian,
    error_handler: HackDayApi.AuthErrorHandler

  plug Guardian.Plug.VerifyHeader, realm: "Bearer"
  plug Guardian.Plug.EnsureAuthenticated
  plug Guardian.Plug.LoadResource
end
