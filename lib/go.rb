module Go
  class Board

    VALID_MARKERS = [:black, :white, nil]

    InvalidStoneTypeError        = Class.new(StandardError)
    AlreadyOccupiedPositionError = Class.new(StandardError)
    InvalidPositionError         = Class.new(StandardError)

    def initialize(board_size)
      @size = board_size
      @data = size.times.map { Array.new(size) }
    end

    attr_reader :size, :data

    def dimensions
      "#{size}x#{size}"
    end

    def [](x,y)
      check_bounds(x,y)
      @data[x][y]
    end

    def []=(x,y,marker)
      check_bounds(x,y)
      raise InvalidStoneTypeError unless VALID_MARKERS.include?(marker)
      raise AlreadyOccupiedPositionError if @data[x][y] && marker

      @data[x][y] = marker
    end

    private

    def check_bounds(x,y)
      raise InvalidPositionError if [x,y].min < 0 || [x,y].max >= size
    end
  end
end
