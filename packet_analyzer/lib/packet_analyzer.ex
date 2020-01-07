defmodule PacketAnalyzer do
  @moduledoc """
  PacketAnalyzer keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  @doc """
  入力されたデータを返します.

  ## パラメータ
    - input_data: 入力文字列です.
  
  ## try-rescue
    input_dataに16進数以外の文字列が与えられた場合にエラーが出るようにしています.
    ただし, 十分な長さがない16進数の文字列でも通ってしまう.
  """
  def analyze(input_data) do
    try do
      input_data
      |> String.to_integer(16)
      |> Integer.to_string(16)
    rescue
      e -> "Error"
    end
  end

  @doc """
  バージョンを返します.

  ## パラメータ
    - analyze: analyzeで返ってきた文字列.

  String.firstで入力文字列の先頭を取得.
  その後, case文を用いてバージョンの振り分け.
  """
  def version(analyze) do
    version = analyze
    |> String.first

    case version do
      "4" -> version<>" -> IP"
      "5" -> version<>" -> ST"
      "6" -> version<>" -> IPv6"
      "7" -> version<>" -> TP/IX"
      "8" -> version<>" -> PIP"
      "9" -> version<>" -> TUBA"
       _  -> "Not Match version"
    end
  end

  @doc """
  ヘッダ長を返します.

  ## パラメータ
    - analyze: analyzeで返ってきた文字列.
  
  String.atを用いて引数の文字列のindexを指定してその場所の文字列を取得.
  """
  def header(analyze) do
    header = analyze
    |> String.at(1)
  end

  @doc """
  サービスタイプを返します.

  ## パラメータ
    - analyze: analyzeで返ってきた文字列.
  
  String.sliceを用いて, 引数のn番目のindexから範囲を指定して文字列をスライスする.
  例えば入力文字列が"ABCDEFG"の場合, data |> String.slice(2,2)を実行すると, 
  "CD"が取得される.
  """
  def service(analyze) do
    analyze
    |> String.slice(2,2)
  end

  @doc """
  パケット長を返します.

  ## パラメータ
    - analyze: analyzeで返ってきた文字列.
  String.sliceを用いて文字列をスライスしている.
  """
  def packet_length(analyze) do
    analyze
    |> String.slice(4,4)
  end

  @doc """
  識別子を返します.

  ## パラメータ
    - analyze: analyzeで返ってきた文字列.
  String.sliceを用いて文字列をスライスしている.
  """
  def identifier(analyze) do
    analyze
    |> String.slice(8,4)
  end

  @doc """
  フラグを返します.

  ## パラメータ
    - analyze: analyzeで返ってきた文字列.
  String.sliceを用いて文字列をスライスしている.
  """
  def flag(analyze) do
    analyze
    |> String.slice(12,4)
  end

  @doc """
  TTLを返します.

  ## パラメータ
    - analyze: analyzeで返ってきた文字列.
  String.sliceを用いて文字列をスライスしている.
  """
  def ttl(analyze) do
    analyze
    |> String.slice(16,2)
  end

  @doc """
  プロトコル番号を返します.

  ## パラメータ
    - analyze: analyzeで返ってきた文字列.
  String.sliceを用いて文字列をスライスしている.
  """
  def procotol(analyze) do
    analyze
    |> String.slice(18,2)
  end

  @doc """
  ヘッダチェックサムを返す.

  ## パラメータ
    - analyze: analyzeで返ってきた文字列.
  String.sliceを用いて文字列をスライスしている.
  """
  def header_check(analyze) do
    analyze
    |> String.slice(20,4)
  end

  @doc """
  送信元IPアドレスを返す.

  ## パラメータ
    - analyze: analyzeで返ってきた文字列.
  String.sliceを用いて文字列をスライスした後, スライスされた文字列をさらにスライスし,
  各々を16進数から10進数に変換し文字列として返還している.
  """
  def source_ip_addr(analyze) do
    ip = analyze
    |> String.slice(24,8)

    ip_1 = String.slice(ip,0,2) |> String.to_integer(16) |> Integer.to_string
    ip_2 = String.slice(ip,2,2) |> String.to_integer(16) |> Integer.to_string
    ip_3 = String.slice(ip,4,2) |> String.to_integer(16) |> Integer.to_string
    ip_4 = String.slice(ip,6,2) |> String.to_integer(16) |> Integer.to_string

    ip<>" -> "<>ip_1<>"."<>ip_2<>"."<>ip_3<>"."<>ip_4
  end

  @doc """
  宛先IPアドレスを返す.

  ## パラメータ
    - analyze: analyzeで返ってきた文字列.
  送信元アドレスと同様.
  """
  def destination_ip_addr(analyze) do
    ip = analyze
    |> String.slice(32,8)

    ip_1 = String.slice(ip,0,2) |> String.to_integer(16) |> Integer.to_string
    ip_2 = String.slice(ip,2,2) |> String.to_integer(16) |> Integer.to_string
    ip_3 = String.slice(ip,4,2) |> String.to_integer(16) |> Integer.to_string
    ip_4 = String.slice(ip,6,2) |> String.to_integer(16) |> Integer.to_string

    ip<>" -> "<>ip_1<>"."<>ip_2<>"."<>ip_3<>"."<>ip_4
  end

  @doc """
  オプションを返す.

  ## パラメータ
    - analyze: analyzeで返ってきた文字列.
  String.sliceを用いて文字列をスライスしている.
  """
  def option(analyze, n) do
    analyze
    |> String.slice(40,8*n)
  end

  @doc """
  データを返す.

  ## パラメータ
    - analyze: analyzeで返ってきた文字列.
  String.sliceを用いて文字列をスライスしている.
  """
  def data(analyze, n) do
    analyze
    |> String.slice(40+8*n..-1)
  end
  
  
end
