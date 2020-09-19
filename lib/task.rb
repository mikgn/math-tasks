# frozen_string_literal: true

class Task
  attr_reader :params

  def initialize
    @params = generate_params
  end

  def to_s
    "#{params[:first_number]} #{params[:operator]} #{params[:second_number]} = ?"
  end

  private

  def generate_params
    arith_operators = ['+', '-', '*', '/']
    answer = 100

    until (0..99).to_a.include?(answer)
      first_number = rand(100).to_f
      second_number = rand(100).to_f
      operator = arith_operators.sample

      answer = check_answer(first_number, second_number, operator)
    end

    build_params(first_number, second_number, operator, answer)
  end

  def check_answer(first_number, second_number, operator)
    first_number.send(operator, second_number)
  end

  def build_params(first_number, second_number, operator, answer)
    {
      first_number: first_number.to_i,
      operator: operator,
      second_number: second_number.to_i,
      answer: answer.to_i
    }
  end
end
