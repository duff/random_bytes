defmodule RandomBytes do

  def base62(num_bytes \\ 16) do
    random_bytes(num_bytes)
    |> Base.encode64(padding: false)
    |> String.replace(~r/[+\/]/, random_char)
  end

  def base16(num_bytes \\ 16) do
    random_bytes(num_bytes)
    |> Base.encode16(case: :lower)
  end

  def hex(num_bytes \\ 16), do: base16(num_bytes)

  def uuid do
    Regex.run(uuid_regex, base16, capture: :all_but_first)
    |> Enum.join("-")
  end

  defp uuid_regex do
    ~r/(.{8})(.{4})(.{4})(.{4})(.{12})/
  end

  @base62_alphabet 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789'

  defp random_char do
    [Enum.random(@base62_alphabet)] |> to_string
  end

  defp random_bytes(num) do
    :crypto.strong_rand_bytes(num)
  end

end
