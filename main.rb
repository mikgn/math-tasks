# frozen_string_literal: true

require_relative 'lib/console_interface.rb'
require_relative 'lib/game.rb'
require_relative 'lib/task.rb'

user_params = ConsoleInterface.get_user_data

loop do
  tasks = Array.new(user_params[:tasks_count]) { Task.new }
  game_params = user_params.merge(tasks: tasks)
  game = Game.new(game_params)

  tasks.each_with_index do |task, i|
    puts "#{i + 1}) #{task}"

    user_answer = ConsoleInterface.get_user_answer

    if user_answer == task.params[:answer]
      game.solved_tasks_count += 1
    end
  end
  game.solving_tasks_time = Time.now - game.solving_tasks_time

  puts ConsoleInterface.print_result(game)
  game.save_result
  puts ConsoleInterface.sugget_new_game
end
