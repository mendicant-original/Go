module Go
  class Board
    def initialize(board_size)
      @size = board_size
    end

    attr_reader :size

    def dimensions
      "#{size}x#{size}"
    end
  end
end
