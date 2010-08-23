require_relative "test_helper"

class BoardTest < Test::Unit::TestCase

  setup do
    @board = Go::Board.new(9)
  end

  test "A board has dimensions" do
    assert_equal "9x9", @board.dimensions
  end

  test "All intersections are empty by default" do
    @board.size.times do |x|
      @board.size.times do |y|
        assert_nil @board[x,y]
      end
    end
  end

  test "Can place a white stone on the board" do
    @board[3,4] = :white
    assert_equal :white, @board[3,4]
  end

  test "Can place a black stone on the board" do
    @board[3,5] = :black
    assert_equal :black, @board[3,5]
  end

  test "Can empty an intersection" do
    @board[3,4] = :black
    @board[3,4] = nil
    assert_equal nil, @board[3,4]
  end

  test "Can place a new stone on an emptied intersection" do
    @board[3,4] = :black

    @board[3,4] = nil
    @board[3,4] = :white
    assert_equal :white, @board[3,4]

    @board[3,4] = nil
    @board[3,4] = :black
    assert_equal :black, @board[3,4]
  end

  test "Cannot replace a black stone with a white stone" do
    @board[3,4] = :black
    assert_raises(Go::Board::AlreadyOccupiedPositionError) do
      @board[3,4] = :white
    end
  end

  test "Cannot replace a white stone with a black stone" do
    @board[3,4] = :white
    assert_raises(Go::Board::AlreadyOccupiedPositionError) do
      @board[3,4] = :black
    end
  end

  test "Cannot place arbitrary markers on board" do
    assert_raises(Go::Board::InvalidStoneTypeError) do
      @board[3,6] = :green
    end
  end

end
