# todo:
#
#  DONE 1) index() - return the whole txt file 
#  DONE 2) find(id) - finds a line and returns it
#  DONE 3) where(pattern) - finds all lines with a matched pattern
#  DONE 4) update(id, text) - finds and updates a line
#  DONE 5) delete(id) - removes a line  
#  DONE 6) create(name) - adds a line to the files`s end
#
#   id - line index


FILE_PATH = "file.txt"
BUFFER = "buffer.txt"


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
        if id == index

        else
            file.puts(line)
        end
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




create('Abobus', FILE_PATH)
create('SUgoma', FILE_PATH)
create('i hate lections lmao', FILE_PATH)
create('No, really, i truly do', FILE_PATH)



where("Abo", FILE_PATH)
puts '________'
update(2, "Among us", FILE_PATH, BUFFER )
puts '________'
find(3, FILE_PATH)
puts '________'
index(FILE_PATH)
puts '________'

delete(2, FILE_PATH, BUFFER)
puts '________'
index(FILE_PATH)
puts '________'
# file_handle.close
