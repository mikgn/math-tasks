#frozen_string_literal: true

module ConsoleInterface
  extend self

  def get_user_data
    {
      user_name: get_user_name,
      user_age: get_user_age,
      tasks_count: get_tasks_count
    }
  end

  def get_user_answer
    user_input = ''

    until user_input =~ /^\d+$/
      user_input = STDIN.gets.strip
    end
    user_input.to_i
  end

  def print_result(game)
    tasks_count = game.tasks.size
    solved_tasks_count = game.solved_tasks_count
    total_solving_time = game.solving_tasks_time.round(2)
    rand_task_time = (total_solving_time / tasks_count).round(2)

    %(
      Результат:
      Количество правильно решённых примеров: #{solved_tasks_count}
      Общее количество примеров: #{tasks_count}
      Среднеее время решения одного примера: #{rand_task_time}с.
      Общее время решения: #{total_solving_time}с.
    )
  end

  def sugget_new_game
    user_answer = ''

    until user_answer =~ /^[YN]$/
      puts
      puts 'Хотите проверить себя еще раз? (Y/N) '
      puts 'Если хотите другое количество вопросов, начните игру заново'
      user_answer = STDIN.gets.strip
    end
    unless user_answer == 'Y'
      puts
      puts 'Статистику игр можно посмотреть в файле math-tasks/data/statistics.csv'
      puts 'Неплохо поработали! Ждем Вас снова!'
      abort
    end
  end

  private

  def get_user_name
    user_name = ''

    until user_name =~ /^[[:alpha:]]{3,20}$/i
      print 'Введите имя (Используйте буквы, от 3 до 20 символов): '
      user_name = STDIN.gets.strip
    end
    user_name
  end

  def get_user_age
    user_age = 0

    until user_age.positive?
      print 'Введите возраст: '
      user_age = STDIN.gets.to_i
    end
    user_age.to_s
  end

  def get_tasks_count
    tasks_count = 0

    until (10..100).include?(tasks_count)
      print 'Сколько примеров хотите решить? ( Ввведите число от 10 до 100) '
      tasks_count = STDIN.gets.to_i
    end
    tasks_count
  end

  def print_game_start
    puts
    puts "Добро пожаловать в консольное приложение 'Решение математических примеров на время'"
    puts
  end
end
