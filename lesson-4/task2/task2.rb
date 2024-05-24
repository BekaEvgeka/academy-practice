# frozen_string_literal: true

FILE_PATH = 'students.txt'
BUFFER = 'buffer.txt'
RESULT = 'results.txt'

def delete(lines, file_path, buffer_path)
  file = File.open(buffer_path, 'w')
  File.foreach(file_path) do |line|
    file.puts(line) unless lines.include? line.chomp
  end
  file.close
  File.write(file_path, File.read(buffer_path))
  File.delete(buffer_path) if File.exist?(buffer_path)
end

def find_and_write_to_result(pattern, file_path, result_path)
  result_file = File.open(result_path, 'a')
  matched_lines = []

  File.foreach(file_path) do |line|
    matched_lines.push(line.chomp) if line.include? pattern.to_s
    result_file.puts(line) if line.include? pattern.to_s
  end
  p matched_lines
  delete(matched_lines, FILE_PATH, BUFFER)

  result_file.close
  matched_lines
end

def index(file_path)
  file_data = File.read(file_path)

  puts file_data
end

loop do
  if File.zero?(FILE_PATH)
    puts 'No more students, terminating the programm....'
    index(RESULT)
    File.write(FILE_PATH, File.read('students_base.txt'))
    break
  end
  puts 'Enter student age:'
  student_age = gets.chomp
  if student_age.to_i == -1
    index(RESULT)
    break
  else
    # implement other pattern matching???
    find_and_write_to_result(student_age.to_i, FILE_PATH, RESULT)
  end
end
