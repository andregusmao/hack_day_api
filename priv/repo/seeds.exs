# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     HackDayApi.Repo.insert!(%HackDayApi.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias HackDayApi.Account

Account.create_users(%{
  "name" => "andre.gusmao",
  "password" => "12345",
  "email" => "andre.gusmao@rcky.com.br",
  "age" => 49
})
