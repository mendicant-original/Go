require_relative "test_helper"

class BoardTest < Test::Unit::TestCase
  test "A board has dimensions" do
    board = Go::Board.new(9)
    assert_equal "9x9", board.dimensions
  end
end
