class ResultPrinter
  def initialize(file_name)
    @answers = []

    return nil unless File.exist?(file_name)

    7.times do
      file = File.new(file_name, 'r:UTF-8')
      @answers = file.readlines
      file.close
    end
  end

  def print_result(test)
    puts "Ваш результат #{test.points} баллов:"

    case test.points
    when 30..32 then puts @answers[0]
    when 25..29 then puts @answers[1]
    when 19..24 then puts @answers[2]
    when 14..18 then puts @answers[3]
    when 9..13  then puts @answers[4]
    when 4..8   then puts @answers[5]
    when 0..3   then puts @answers[6]
    end
  end
end
