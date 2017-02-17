# Dynamic Programming practice
# NB: you can, if you want, define helper functions to create the necessary caches as instance variables in the constructor.
# You may find it helpful to delegate the dynamic programming work itself to a helper method so that you can
# then clean out the caches you use.  You can also change the inputs to include a cache that you pass from call to call.

class DPProblems
  def initialize
    # Use this to create any instance variables you may need
    @fib_cache = {1 => 1, 2 => 1}
    @step_cache = {0 => [[]], 1 => [[1]], 2=> [[1,1], [2]]}
  end

  # Takes in a positive integer n and returns the nth Fibonacci number
  # Should run in O(n) time
  def fibonacci(n)
    return @fib_cache[n] if @fib_cache[n]
    out = fibonacci(n-1) + fibonacci(n-2)
    @fib_cache[n] = out
    out
  end

  # Make Change: write a function that takes in an amount and a set of coins.  Return the minimum number of coins
  # needed to make change for the given amount.  You may assume you have an unlimited supply of each type of coin.
  # If it's not possible to make change for a given amount, return nil.  You may assume that the coin array is sorted
  # and in ascending order.
  def make_change(amt, coins, coin_cache = {0 => 0})
    return coin_cache[amt] if coin_cache[amt]
    return 0.0/0.0 if amt < coins[0]
    idx = 0
    min = amt
    found = false
    while idx < coins.length
      count = make_change(amt - coins[idx], coins, coin_cache)
      if count.is_a?(Integer)
        count += 1
        min = count if count < min
        found = true
      end
      idx += 1
    end
    coin_cache[amt] = found ? min : 0.0/0.0
  end

  # Knapsack Problem: write a function that takes in an array of weights, an array of values, and a weight capacity
  # and returns the maximum value possible given the weight constraint.  For example: if weights = [1, 2, 3],
  # values = [10, 4, 8], and capacity = 3, your function should return 10 + 4 = 14, as the best possible set of items
  # to include are items 0 and 1, whose values are 10 and 4 respectively.  Duplicates are not allowed -- that is, you
  # can only include a particular item once.
  def knapsack(weights, values, capacity)
    table = []
    (0..capacity).each do |i|
      table[i] = []
      weights.each_index do |j|
        if i == 0
          table[i][j] = 0
        elsif j == 0
          table[i][j] = weights[j] > i ? 0 : values[j]
        else
          first = table[i][j-1]
          second = i < weights[j] ? 0: table[i-weights[j]][j - 1] + values[j]
          table[i][j] = [first, second].max
        end
      end
    end
    table[capacity][weights.length - 1]
  end

  # Stair Climber: a frog climbs a set of stairs.  It can jump 1 step, 2 steps, or 3 steps at a time.
  # Write a function that returns all the possible ways the frog can get from the bottom step to step n.
  # For example, with 3 steps, your function should return [[1, 1, 1], [1, 2], [2, 1], [3]].
  # NB: this is similar to, but not the same as, make_change.  Try implementing this using the opposite
  # DP technique that you used in make_change -- bottom up if you used top down and vice versa.
  def stair_climb(n)
    return @step_cache[n] if @step_cache[n]
    ways = []
    1.upto(3) do |i|
      prev = stair_climb(n - i)
      prev = prev.map do |steps|
        temp = steps.dup
        temp << i
        temp
      end
      ways += prev
    end
    ways.sort!
    @step_cache[n] = ways
    ways
  end

  # String Distance: given two strings, str1 and str2, calculate the minimum number of operations to change str1 into
  # str2.  Allowed operations are deleting a character ("abc" -> "ac", e.g.), inserting a character ("abc" -> "abac", e.g.),
  # and changing a single character into another ("abc" -> "abz", e.g.).
  def str_distance(str1, str2)
    matrix = Array.new(str1.length + 1) { Array.new(str2.length + 1) }
    (0..str1.length).each do |i|
      (0..str2.length).each do |j|
        if i == 0
          matrix[i][j] = j
        elsif j == 0
          matrix[i][j] = i
        else
          option1 = matrix[i-1][j]
          option2 = matrix[i][j-1]
          option3 = matrix[i-1][j-1]
          matrix[i][j] = [option1, option2, option3].min
          matrix[i][j] += 1 if str1[i-1] != str2[j-1]
        end
      end
    end
    matrix[str1.length][str2.length]
  end

  # Maze Traversal: write a function that takes in a maze (represented as a 2D matrix) and a starting
  # position (represented as a 2-dimensional array) and returns the minimum number of steps needed to reach the edge of the maze (including the start).
  # Empty spots in the maze are represented with ' ', walls with 'x'. For example, if the maze input is:
  #            [['x', 'x', 'x', 'x'],
  #             ['x', ' ', ' ', 'x'],
  #             ['x', 'x', ' ', 'x']]
  # and the start is [1, 1], then the shortest escape route is [[1, 1], [1, 2], [2, 2]] and thus your function should return 3.
  def maze_escape(maze, start)
    maze_helper(maze, start)
  end

  def maze_helper(maze, start, seen = {})
    if (start[0] == maze.length - 1 || start[1] == maze[0].length - 1 || start[0] == 0 || start[1] == 0)
      seen[start] = 1
      return 1
    end

    return seen[start] if seen[start]

    moves = [
      [start[0] - 1, start[1]],
      [start[0] + 1, start[1]],
      [start[0], start[1] - 1],
      [start[0], start[1] + 1]
    ]
    valid_moves = moves.select { |pos| maze[pos[0]][pos[1]] == ' ' }
    found = false
    min_path = maze.length * maze[0].length
    valid_moves.each do |move|
      temp_maze = temp_maze_generator(maze, start)
      prev = maze_helper(temp_maze, move, seen)
      if prev.is_a?(Integer) && prev < min_path
        found = true
        min_path = prev
      end
    end

    if found
      seen[start] = min_path + 1
      return min_path + 1
    else
      seen[start] = 0.0/0.0
      return 0.0/0.0
    end
  end

  def temp_maze_generator(maze, temp_pos)
    temp_maze = []
    maze.each do |row|
      temp_row = []
      row.each do |col|
        temp_row << col
      end
      temp_maze << temp_row
    end
    temp_maze[temp_pos[0]][temp_pos[1]] = 'x'
    temp_maze
  end

end
