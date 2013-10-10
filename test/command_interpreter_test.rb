gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/command_interpreter'

class FakeCommandRunner
  def load(filename)
    "running load with #{filename}"
  end

  def queue_print(order)
    "running queue print ordered by #{order}"
  end

  def queue_count
    "running queue count"
  end

  def queue_clear
    "running queue clear"
  end

  def queue_save(filename)
    "saving the queue to #{filename}"
  end

  def help(secondary_command = nil)
    case secondary_command 
    when nil
      "running help"
    when "load"
      "running help load"
    when "find"
      "running help find"
    when "queue"
      "running help queue"
    end
  end

  def find(attribute, criteria)
    "finding #{attribute} with #{criteria}"
  end
end

class CommandInterpreterTest < Minitest::Test 
  attr_reader :ci

  def setup
    @ci = CommandInterpreter.new(FakeCommandRunner)
  end

  def test_it_accepts_a_load_instruction
    command = "load some_data.csv"
    result = ci.run(command)
    
    assert_equal "running load with some_data.csv", result
  end

  def test_it_runs_load_without_a_filename
    result = ci.run("load")
    assert_equal "running load with event_attendees.csv", result
  end

  def test_it_prints_ordered_by_the_last_name
    result = ci.run("queue print by last_name")
    assert_equal "running queue print ordered by last_name", result
  end

  def test_it_counts_the_queue
    result = ci.run("queue count")
    assert_equal "running queue count", result
  end

  def test_it_clears_the_queue
    result = ci.run("queue clear")
    assert_equal "running queue clear", result
  end

  def test_it_can_save_to_filename
    result = ci.run("queue save to some_file.csv")
    assert_equal "saving the queue to some_file.csv", result
  end

  def test_it_runs_full_help_command
    result = ci.run("help")
    assert_equal "running help", result
  end

  def test_it_runs_help_with_a_specified_command
    result = ci.run("help load")
    assert_equal "running help load", result
  end

  def test_it_runs_the_find_command
    result = ci.run("find zipcode 20011")
    assert_equal "finding zipcode with 20011", result
  end

end
