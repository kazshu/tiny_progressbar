require "tiny_progressbar/version"

class TinyProgressbar
  attr_reader :goal, :now
  CR = "\r"
  FORMAT= '[%-30s] (%03d/%03d done)'

  def initialize(goal)
    @goal = goal
    @now = 0
    display
  end

  def succeed
    @now += 1
    back_cursor
    display
  end

  def clear
    print CR + ' ' * 100 + CR
  end

  private

  def back_cursor
    print CR
  end

  def display
    print FORMAT % [('=' * (30 * @now / @goal)), @now, @goal]
  end
end
