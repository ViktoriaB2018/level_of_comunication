class Test
  attr_reader :points
  attr_accessor :version

  NUMBERS_WITH_INVERSED_POINTS = [4, 9, 10, 12]

  def initialize(file_name)
    @questions = []
    @points = 0
    @current_question = 0

    file = File.new(file_name, 'r:UTF-8')
    @questions = file.readlines
    file.close
  end

  def next_question
    @questions[@current_question]
  end

  def current_questions_inverted?
    NUMBERS_WITH_INVERSED_POINTS.include?(@current_question)
  end

  def count_points(answer)
    if current_questions_inverted? && answer == 2 ||
      !current_questions_inverted? && answer == 1
      @points += 2
    elsif answer == 3
      @points += 1
    end

    @current_question += 1
  end

  def finished?
    @current_question >= @questions.length
  end
end
