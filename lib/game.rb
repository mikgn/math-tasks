# frozen_string_literal: true

require 'csv'

class Game
  attr_reader :user_name, :user_age, :tasks
  attr_accessor :solved_tasks_count, :solving_tasks_time

  def initialize(params)
    @user_name = params[:user_name]
    @user_age = params[:user_age]
    @tasks = params[:tasks]
    @solved_tasks_count = 0
    @solving_tasks_time = Time.now
  end

  def avarage_task_time(solved_tasks_count, solving_tasks_time)
    (solving_tasks_time / solved_tasks_count).round(2)
  end

  def save_result
    CSV.open("#{__dir__}/../data/statistics.csv", 'ab') do |csv|
      game_data = [
        user_name,
        user_age,
        tasks.size,
        solved_tasks_count,
        avarage_task_time(solved_tasks_count, solving_tasks_time),
        solving_tasks_time.round(2),
        Time.now.strftime('%d-%m-%Y')
      ]

      csv << game_data
    end
  end
end
