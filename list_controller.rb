require_relative 'item'
require_relative 'todo_parser'
require_relative 'todo_writer'

class ListController

  attr_reader :list, :file_name

  def initialize(list, file_name)
    @list = list
    @file_name = file_name
  end  

  def add(content)
    @list << Item.new(content)
    TodoWriter.write(@file_name, @list)
    #save to and update text file
  end

  def delete(id)
    @list.delete_at(id-1)
    TodoWriter.write(@file_name, @list)
  end
  
  def completed(id)
    @list[id-1].completed = "X"
    TodoWriter.write(@file_name, @list)
  end     

  def display
    list.each_with_index do |item, index|
      if item.completed == "X"
        puts "[X] #{index + 1}. #{item.content}"
      else  
        puts "[ ] #{index + 1}. #{item.content}"
      end  
    end  
  end  

  def display_outstanding
    arr = []
    list.each do |item|
      if item.completed != "X"
        arr << item
      end  
    end
    arr.each_with_index do |item, index|
      puts "[ ] #{index + 1}. #{item.content}"
    end 
  end

  def display_completed
    arr = []
    list.each do |item|
      if item.completed == "X"
        arr << item
      end  
    end
    arr.each_with_index do |item, index|
      puts "[X] #{index + 1}. #{item.content}"
    end  
  end  

end
