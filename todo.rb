require_relative 'list_controller'
require_relative 'todo_parser'
require_relative 'todo_writer'
require_relative 'item'

puts "Welcome to your to do task list"
puts "Please enter your filename"
file_name = gets.chomp
content_list = []
list = ListController.new(content_list, file_name)

TodoParser.each_entry(list.file_name) do |entry|
  content_list << Item.new(entry["description"], entry["completed"]) 
end
quit = true
list.display
while quit
  puts "What would you like to do?"
  puts "1.Delete task\n2.Add task\n3.Mark completed\n4.Show outstanding list\n5.Show completed list\n6.Quit"
  input = gets.chomp
  if input.to_i == 1
    list.display
    puts "Type the list number you want to delete"
    number = gets.chomp
    list.delete(number.to_i)
    puts "-------------------------"
  elsif input.to_i == 2  
    list.display
    puts "Type the task you want to add"
    task = gets.chomp
    list.add(task)
    puts "-------------------------"
  elsif input.to_i == 3
    list.display 
    puts "Mark the list number you have completed"
    number = gets.chomp
    list.completed(number.to_i)
    puts "-------------------------"
  elsif input.to_i == 4
    list.display_outstanding  
    puts "-------------------------"
  elsif input.to_i == 5
    list.display_completed
    puts "-------------------------"
  elsif input.to_i == 6
    quit = false
    puts "Good bye!"
  else
    puts "Wrong input"
  end
  # list.display
end
