require_relative 'lib/test.rb'
require_relative 'lib/result_printer.rb'

current_path = File.dirname(__FILE__)

VERSION = 'Тест на коммуникабельность, версия 3.'

printer = ResultPrinter.new(current_path + '/files/answers.txt')
test = Test.new(current_path + '/files/questions.txt')
test.version = VERSION

puts 'Как вас зовут?'
name = gets.chomp.encode('UTF-8')

puts "Здравствуйте, #{name}, пройдите тест и определите " \
     'уровень вашей коммуникабельности'
puts 'Для этого необходимо правдиво ответить на следующие вопросы:'
puts

until test.finished?
  puts test.next_question
  answer = 0
  until answer.between?(1, 3)
    puts 'Варианты ответа: 1 - да, 2 - нет, 3 - иногда'
    puts 'Введите число и нажмите Enter'
    answer = gets.to_i
  end
  test.count_points(answer)
end

printer.print_result(test)
