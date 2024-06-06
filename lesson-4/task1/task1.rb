# frozen_string_literal: true

FILE_PATH = 'file.txt'
BUFFER = 'buffer.txt'

def index(file_path)
  file_data = File.read(file_path)

  puts file_data
end

def find(id, file_path)
  file_data = File.readlines(file_path).map(&:chomp)

  puts file_data[id]
end

def where(pattern, file_path)
  matched_lines = []

  File.foreach(file_path) do |line|
    matched_lines.push(line.chomp) if line.include? pattern
  end

  p matched_lines
end

def update(id, text, file_path, buffer_path)
  file = File.open(buffer_path, 'w')
  File.foreach(file_path).with_index do |line, index|
    if id == index
      file.puts(text)
    else
      file.puts(line)
    end
  end

  file.close

  File.write(file_path, File.read(buffer_path))

  File.delete(buffer_path) if File.exist?(buffer_path)
end

def delete(id, file_path, buffer_path)
  file = File.open(buffer_path, 'w')
  File.foreach(file_path).with_index do |line, index|
    file.puts(line) unless id == index
  end
  file.close

  File.write(file_path, File.read(buffer_path))

  File.delete(buffer_path) if File.exist?(buffer_path)
end

def create(text, file_path)
  file = File.open(file_path, 'a')
  file.puts(text)

  file.close
end
