gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/queue'

class QueueTest < Minitest::Test
  def test_it_counts
    queue = Queue.new
    assert_equal 0, queue.count
  end

  def test_it_holds_data
    queue = Queue.new
    queue.add([1, 2, 3])
    queue.add([4, 5, 6])
    assert_equal 6, queue.count
  end

  def test_it_clears_itself
    queue = Queue.new
    queue.add([1, 2])
    queue.clear 
    assert_equal 0, queue.count
  end

end
