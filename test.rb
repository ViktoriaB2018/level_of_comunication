class Test
  attr_reader :points
  
  def initialize(file_name)
    @questions = []

    return nil unless File.exist?(file_name)

    16.times do
      file = File.new(file_name, 'r:UTF-8')
      @questions = file.readlines
      file.close
    end

    @points = 0
    @current_question = 0
  end

  def next_question
    @questions[@current_question]
  end

  def count_points(answer)
    numbers_with_inversed_points = [4, 9, 10, 12]
    if numbers_with_inversed_points.include?(@current_question) && answer == 2 ||
      !numbers_with_inversed_points.include?(@current_question) && answer == 1
      @points += 2
    elsif answer == 3
      @points += 1
    end

    @current_question += 1
    @questions[@current_question]
  end

  def finished?
    @current_question >= @questions.length
  end
end
