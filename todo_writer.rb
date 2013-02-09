class TodoWriter

  def self.write(path, objects)
    output = File.open(path, 'wb')
    objects.each_with_index do |object, index|
      output << "X " if object.completed == "X"
      output << "#{index+1}. #{object.content}"
      output << "\n" unless index == objects.length - 1
    end
    output.close
  end
end
