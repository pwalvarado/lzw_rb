require_relative 'test_helper'
require 'lzw'

class LZWTest < MiniTest::Test
  def test_compress
    compressed = LZW.compress('TOBEORNOTTOBEORTOBEORNOT')
    assert_equal compressed, ["T", "O", "B", "E", "O", "R", "N", "O", "T", 256, 258, 260, 265, 259, 261, 263]
  end

  def test_decompress
    string = 'TOBEORNOTTOBEORTOBEORNOT'
    compressed = LZW.compress(string)
    assert_equal LZW.decompress(compressed), string
  end
end
