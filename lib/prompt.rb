require './lib/command_interpreter'
require './lib/command_runner'

class Prompt

def run
  puts "Welcome to Event Reporter. IT IS SO MUCH FUN!!!!"
  command_interpreter = CommandInterpreter.new


  input = nil
  while input != "exit"
    printf "Enter command: "
    input = gets.chomp
    puts command_interpreter.run(input)
  end
end



end

Prompt.new.run

