require './lib/command_runner'

class CommandInterpreter

   

  attr_reader :runner

  def initialize(runner_input = CommandRunner)
    @runner = runner_input.new
  end

  def default_filename
    "event_attendees.csv"
  end

  def run(command)
    # load file.csv
    parts = command.split
    instruction = parts[0]

    if instruction == "load"
      filename = parts[1] || default_filename
      runner.load(filename)
    elsif instruction == "queue"
      run_queue(parts[1..-1])
    elsif instruction == "help"
      run_help(parts[1..-1])
    elsif instruction == "find"
      attribute = parts[2]
      criteria = parts[3]
      runner.send("find_attendees_by_#{attribute}", criteria)
    elsif instruction == "exit"
      printf "See ya later alligator!!!! :)"
    else
      printf "Sorry, I don't know how to run #{command}"
    end
  end

  def run_queue(fragments)
    case fragments.first
    when "print"
      # order = fragments.last
      # runner.queue_print(order)
      runner.queue_print
    when "count"
      runner.queue_count
    when "clear"
      runner.queue_clear
    when "save"
      filename = fragments.last
      runner.queue_save(filename)
    end
  end

  def run_help(fragments)
    case fragments.first
    when nil
      runner.help
    else
      command = fragments.join(' ')
      runner.help_for_command(command)
    end
  end

end
