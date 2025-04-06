defmodule PacketAnalyzerTest do
  use ExUnit.Case
  doctest PacketAnalyzer

  test "analyzes a sample packet" do
    # 仮のデータを用いた主要機能のテスト
    result = PacketAnalyzer.analyze_packet("sample_data")
    assert result == :ok
  end
end
