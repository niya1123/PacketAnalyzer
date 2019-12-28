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
    version = analyze
    |> Integer.to_string(16)
    |> String.first

    case version do
      "4" -> version<>" -> IP"
      "5" -> version<>" -> ST"
      "6" -> version<>" -> IPv6"
      "7" -> version<>" -> TP/IX"
      "8" -> version<>" -> PIP"
      "9" -> version<>" -> TUBA"
    end
  end

  def header(analyze) do
    header = analyze
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

  def flag(analyze) do
    analyze
    |> Integer.to_string(16)
    |> String.slice 12,4
  end

  def ttl(analyze) do
    analyze
    |> Integer.to_string(16)
    |> String.slice 16,2
  end

  def procotol(analyze) do
    analyze
    |> Integer.to_string(16)
    |> String.slice 18,2
  end

  def header_check(analyze) do
    analyze
    |> Integer.to_string(16)
    |> String.slice 20,4
  end

  def source_ip_addr(analyze) do
    ip = analyze
    |> Integer.to_string(16)
    |> String.slice 24,8

    ip_1 = String.slice(ip,0,2) |> String.to_integer(16) |> Integer.to_string
    ip_2 = String.slice(ip,2,2) |> String.to_integer(16) |> Integer.to_string
    ip_3 = String.slice(ip,4,2) |> String.to_integer(16) |> Integer.to_string
    ip_4 = String.slice(ip,6,2) |> String.to_integer(16) |> Integer.to_string

    ip<>" -> "<>ip_1<>"."<>ip_2<>"."<>ip_3<>"."<>ip_4
  end

  def destination_ip_addr(analyze) do
    ip = analyze
    |> Integer.to_string(16)
    |> String.slice 32,8

    ip_1 = String.slice(ip,0,2) |> String.to_integer(16) |> Integer.to_string
    ip_2 = String.slice(ip,2,2) |> String.to_integer(16) |> Integer.to_string
    ip_3 = String.slice(ip,4,2) |> String.to_integer(16) |> Integer.to_string
    ip_4 = String.slice(ip,6,2) |> String.to_integer(16) |> Integer.to_string

    ip<>" -> "<>ip_1<>"."<>ip_2<>"."<>ip_3<>"."<>ip_4
  end

  def option(analyze, n) do
    analyze
    |> Integer.to_string(16)
    |> String.slice 40,8*n
  end

  def data(analyze, n) do
    analyze
    |> Integer.to_string(16)
    |> String.slice (40+8*n)..-1
  end
  
  
end
