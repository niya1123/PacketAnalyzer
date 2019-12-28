defmodule PacketAnalyzer do
  @moduledoc """
  PacketAnalyzer keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  def analyze(input_data) do
    try do
      input_data
      |> String.to_integer(16)
    rescue
      e in ArgumentError -> "Error"
      e in RuntimeError -> "Error"
    end
  end

  def version(analyze) do
    analyze
    |> Integer.to_string(16)
    |> String.first
  end

  def header(analyze) do
    analyze
    |> Integer.to_string(16)
    |> String.at(1)
  end

  def service(analyze) do
    analyze
    |> Integer.to_string(16)
    |> String.slice 2,2
  end

  def packet_length(analyze) do
    analyze
    |> Integer.to_string(16)
    |> String.slice 4,4
  end

  def identifier(analyze) do
    analyze
    |> Integer.to_string(16)
    |> String.slice 8,4
  end
  
end
