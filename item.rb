class Item
  attr_accessor :completed
  attr_reader :content

  def initialize(content, completed = "")
    @content = content
    @completed = completed
  end
end
